import 'package:fabricator_builder/src/models/models.dart';
import 'package:fabricator_builder/src/parsers/interfaces/document_parser_interface.dart';
import 'package:fabricator_builder/src/parsers/parsers.dart';

class DocumentParser implements IDocumentParser {
  DocumentParser(
    this._schemeParser,
    this._securitySchemeParser,
    this._requestParser,
  );

  final SchemaParser _schemeParser;
  final SecuritySchemeParser _securitySchemeParser;
  final RequestParser _requestParser;
  @override
  Document parse(Map<String, dynamic> data) {
    _validate(data);
    final title = data['info']['title'];
    final version = data['info']['version'];
    final description = data['info']['description'];
    final termsOfService = data['info']['termsOfService'];
    final contact = data['info']['contact'];
    final license = data['info']['license'];
    final List<Server> servers = [];
    if (data['servers'] != null && data['servers'].isNotEmpty) {
      for (final server in data['servers']) {
        servers.add(
          Server(
            url: server['url'],
            description: server['description'],
          ),
        );
      }
    }

    final components = _parseComponents(data['components']?['schemas'] ?? {});
    final securitySchemes =
        _parseSecuritySchemes(data['components']?['securitySchemes'] ?? {});
    final services = _parseServices(
      data['paths'],
      _parseTags(data['tags']),
    );

    return Document(
      //pass all possible variables to the document
      services: services,
      securitySchemes: securitySchemes,
      servers: servers,
      components: components,
      title: title,
      version: version,
      description: description,
      termsOfService: termsOfService,
      contact: contact,
      license: license,
    );
  }

  @override
  // TODO(Edgar): implement supportedVersion
  String get supportedVersion => throw UnimplementedError();

  Map<String, Schema> _parseComponents(Map<String, dynamic>? data) {
    final Map<String, Schema> schemas = {};
    if (data != null) {
      for (final schema in data.entries) {
        schemas[schema.key] = _schemeParser.parse(schema.value);
      }
    }
    return schemas;
  }

  List<SecurityScheme> _parseSecuritySchemes(Map<String, dynamic>? data) {
    final List<SecurityScheme> securitySchemes = [];
    if (data != null) {
      for (final securityScheme in data.entries) {
        securitySchemes.add(
          _securitySchemeParser.parse({
            securityScheme.key: securityScheme.value,
          }),
        );
      }
    }
    return securitySchemes;
  }

  List<Service> _parseServices(Map<String, dynamic> data, List<Tag> tags) {
    final List<Service> services = [];
    final List<Request> requests = [];
    for (final path in data.entries) {
      for (final MapEntry<String, dynamic> method in path.value.entries) {
        requests.add(
          _requestParser.parse({
            'path': path.key,
            'method': method.key,
            ...method.value,
          }),
        );
      }
    }
    for (final tag in tags) {
      final List<Request> requestsForTag = requests
          .where((request) => request.tags?.contains(tag.name) ?? false)
          .toList();
      services.add(
        Service(
          tag: tag.name,
          description: tag.description,
          requests: requestsForTag,
        ),
      );
    }
    final List<Request> requestsWithoutTag =
        requests.where((request) => request.tags?.isEmpty ?? true).toList();
    if (requestsWithoutTag.isNotEmpty) {
      services.add(
        Service(
          tag: 'Default',
          description: 'Default service',
          requests: requestsWithoutTag,
        ),
      );
    }

    return services;
  }

  void _validate(Map<String, dynamic> data) {
    if (data['info'] == null) {
      throw Exception('Document info is required.');
    }
    if (data['info']['title'] == null) {
      throw Exception('Document title is required.');
    }
    if (data['info']['version'] == null) {
      throw Exception('Document version is required.');
    }
    if (data['paths'] == null) {
      throw Exception('Document paths are required.');
    }
  }

  List<Tag> _parseTags(List<dynamic>? data) {
    final List<Tag> tags = [];
    if (data != null) {
      for (final tag in data) {
        tags.add(
          Tag(
            name: tag['name'],
            description: tag['description'],
          ),
        );
      }
    }
    return tags;
  }
}
