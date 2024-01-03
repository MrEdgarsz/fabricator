import 'package:dio/dio.dart';
import 'package:example/fabricator_example/request_security.dart';
import 'package:example/fabricator_example/requests/get_items/get_items_response.dart';
import 'package:example/fabricator_example/securities/security.dart';
import 'package:example/fabricator_example/utils/request_security_mixin.dart';

class GetItemsRequest with RequestSecurityMixin {
  GetItemsRequest({required BaseOptions dioOptions}) : _dioOptions = dioOptions;

  ///this comes from service but some parts can be overridden
  final BaseOptions _dioOptions;
  Future<GetItemsResponse> call({
    String? filter,
    Set<Security>? securities,
  }) async {
    final dio = Dio(_dioOptions);
    checkSecurityRequirements(securities, _requestSecurities);
    dio.options.headers.addAll(securitiesToHeaders(securities));
    try {
      final result = await dio.get(
        '/items',
        queryParameters: {
          if (filter != null) 'filter': filter,
          ...securitiesToQueryParameters(securities),
        },
      );
      return _mapStatusCodeToResponse(result.statusCode, result.data);
    } on Exception {
      rethrow;
    }
  }

  GetItemsResponse _mapStatusCodeToResponse(
    int? statusCode,
    Map<String, dynamic> data,
  ) =>
      switch (statusCode) {
        200 => GetItems200Response.fromJson(data),
        _ => throw Exception('Unknown status code $statusCode'),
      };

  List<RequestSecurity> get _requestSecurities =>
      [RequestSecurity(name: 'bearerAuth', required: true, or: [])];
}
