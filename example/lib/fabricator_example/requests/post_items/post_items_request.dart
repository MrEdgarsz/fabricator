import 'package:dio/dio.dart';
import 'package:example/fabricator_example/components/item.dart';
import 'package:example/fabricator_example/request_security.dart';
import 'package:example/fabricator_example/requests/post_items/post_items_response.dart';
import 'package:example/fabricator_example/securities/security.dart';
import 'package:example/fabricator_example/utils/request_security_mixin.dart';

class PostItemsRequest with RequestSecurityMixin {
  PostItemsRequest({required BaseOptions dioOptions})
      : _dioOptions = dioOptions;

  ///this comes from service but some parts can be overridden
  final BaseOptions _dioOptions;

  final String _path = '/items';

  Future<PostItemsResponse> call({
    required Item body,
    Set<Security>? securities,
  }) async {
    final dio = Dio(_dioOptions);
    checkSecurityRequirements(securities, _requestSecurities);
    dio.options.headers.addAll(securitiesToHeaders(securities));
    try {
      final result = await dio.post(
        _preparePath(_path, []),
        data: body.toJson(),
        queryParameters: {
          ...securitiesToQueryParameters(securities),
        },
      );
      return _mapStatusCodeToResponse(result.statusCode, result.data);
    } on Exception {
      rethrow;
    }
  }

  PostItemsResponse _mapStatusCodeToResponse(int? statusCode, dynamic data) =>
      switch (statusCode) {
        201 => PostItemsResponse.postItems201Response(
            item: Item.fromJson(data),
          ),
        _ => PostItemsResponse.postItemsUnknownResponse(
            statusCode: statusCode ?? 0,
            data: data,
          )
      };

  List<RequestSecurity> get _requestSecurities =>
      [RequestSecurity(name: 'bearerAuth', required: true, or: [])];

  String _preparePath(String path, List<String> list) {
    String workPath = path;
    for (var i = 0; i < list.length; i++) {
      workPath = workPath.replaceAll('{$i}', list[i]);
    }
    return workPath;
  }
}
