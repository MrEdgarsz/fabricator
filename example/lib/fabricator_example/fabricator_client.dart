import 'package:dio/dio.dart';
import 'package:example/fabricator_example/items_service.dart';
import 'package:example/fabricator_example/securities/security.dart';

class FabricatorClient {
  final String baseUrl;

  final List<Security> _securities = [];

  FabricatorClient(this.baseUrl) {
    _options = BaseOptions(baseUrl: baseUrl);
  }

  late BaseOptions _options;

  Future<List<Security>> addSecurity(Security security) async {
    _securities.add(security);
    return _securities;
  }

  Future<List<Security>> removeSecurity(Security security) async {
    _securities.removeWhere((s) => s.name == security.name);
    return _securities;
  }

  Future<List<Security>> updateSecurity(Security security) async {
    _securities.removeWhere((s) => s.name == security.name);
    _securities.add(security);
    return _securities;
  }

  ItemsService get itemsService => ItemsService(_options, _securities);
}
