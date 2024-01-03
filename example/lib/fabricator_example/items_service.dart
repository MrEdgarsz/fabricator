import 'package:dio/dio.dart';
import 'package:example/fabricator_example/requests/get_items/get_items_request.dart';
import 'package:example/fabricator_example/requests/get_items/get_items_response.dart';
import 'package:example/fabricator_example/securities/security.dart';

class ItemsService {
  final BaseOptions _dioOptions;

  final List<Security> _securities;

  ItemsService(this._dioOptions, this._securities);

  Future<GetItemsResponse> getItems({
    String? filter,
    List<Security>? securities,
  }) {
    Set<Security> mergedSecurities = {...?securities, ..._securities};
    return GetItemsRequest(dioOptions: _dioOptions).call(
      filter: filter,
      securities: mergedSecurities,
    );
  }

  void updateSecurity(Security security) {
    _securities.removeWhere((s) => s.name == security.name);
    _securities.add(security);
  }
}
