import 'package:fabricator_builder/src/models/services/request.dart';

class RequestTemplate {
  final String _template = r""" 
class {{RequestName}} with RequestSecurityMixin {
  {{RequestName}}({required BaseOptions dioOptions})
      : _dioOptions = dioOptions;

  ///this comes from service but some parts can be overridden
  final BaseOptions _dioOptions;
 
  final String _path = {{RequestPath}};

  Future<{{ResponseType}}> call({
    {{RequestParameters}}
    Set<Security>? securities,
  }) async {
    final dio = Dio(_dioOptions);
    checkSecurityRequirements(securities, _requestSecurities);
    dio.options.headers.addAll(securitiesToHeaders(securities));
    try {
      final result = await dio.post(
        _preparePath(_path, [{{PathParametersValues}}]),
        {{ RequestBody }}
        queryParameters: {
          ...securitiesToQueryParameters(securities),
          {{ RequestQueryParameters }}
        },
      );
      return _mapStatusCodeToResponse(result.statusCode, result.data);
    } on Exception {
      rethrow;
    }
  }

  {{ ResponseType }} _mapStatusCodeToResponse(int? statusCode, dynamic data) =>
      switch (statusCode) {
        {{ ResponseCases }}
      };

  List<RequestSecurity> get _requestSecurities =>
      [{{ RequestSecurities }}];

  String _preparePath(String path, List<String> list) {
    String workPath = path;
    for (var i = 0; i < list.length; i++) {
      workPath = workPath.replaceAll('{$i}', list[i]);
    }
    return workPath;
  }
}
  """;

  String prepare({required Request request}) {
    return _template
        .replaceAll('{{RequestName}}', requestName)
        .replaceAll('{{RequestPath}}', requestPath)
        .replaceAll('{{ResponseType}}', responseType)
        .replaceAll('{{RequestBody}}', requestBody)
        .replaceAll('{{RequestParameters}}', requestParameters)
        .replaceAll('{{PathParametersValues}}', pathParametersValues)
        .replaceAll('{{RequestQueryParameters}}', requestQueryParameters)
        .replaceAll('{{ResponseCases}}', responseCases.join('\n'))
        .replaceAll('{{RequestSecurities}}', requestSecurities);
  }
}
