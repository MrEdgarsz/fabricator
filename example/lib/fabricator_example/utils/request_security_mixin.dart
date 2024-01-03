// ignore_for_file: unused_element

import 'package:example/fabricator_example/request_security.dart';
import 'package:example/fabricator_example/securities/security.dart';
import 'package:example/fabricator_example/securities/security_header.dart';
import 'package:example/fabricator_example/securities/security_query.dart';
import 'package:flutter/foundation.dart';

mixin RequestSecurityMixin {
  @protected
  Map<String, String> securitiesToQueryParameters(
      Set<Security>? mergedSecurities) {
    final Map<String, String> queryParameters = {};

    for (final security in mergedSecurities ?? <Security>[]) {
      if (security is SecurityQuery) {
        queryParameters[security.queryName] = security.queryValue;
      }
    }
    return queryParameters;
  }

  @protected
  Map<String, String> securitiesToHeaders(Set<Security>? mergedSecurities) {
    final Map<String, String> headers = {};
    for (final security in mergedSecurities ?? <Security>[]) {
      if (security is HeaderSecurity) {
        headers[security.headerName] = security.headerValue;
      }
    }
    return headers;
  }

  @protected
  void checkSecurityRequirements(Set<Security>? mergedSecurities,
      List<RequestSecurity> requestSecurities) {
    if (requestSecurities.isEmpty) {
      return;
    }
    final List<String> presentSecurityNames =
        mergedSecurities?.map((e) => e.name).toList() ?? [];
    for (final requestSecurity in requestSecurities) {
      if (requestSecurity.required) {
        if (!presentSecurityNames.contains(requestSecurity.name)) {
          //check if any security in or is present
          if (requestSecurity.or.isNotEmpty) {
            if (requestSecurity.or.any((orSecurity) =>
                presentSecurityNames.contains(orSecurity.name))) {
              return;
            }
          }
          throw Exception('Security ${requestSecurity.name} is required');
        }
        {
          return;
        }
      }
    }
  }
}
