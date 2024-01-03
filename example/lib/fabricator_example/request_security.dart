// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class RequestSecurity {
  final String name;
  final bool required;
  final List<RequestSecurity> or;
  RequestSecurity({
    required this.name,
    required this.required,
    required this.or,
  });

  RequestSecurity copyWith({
    String? name,
    bool? required,
    List<RequestSecurity>? or,
  }) {
    return RequestSecurity(
      name: name ?? this.name,
      required: required ?? this.required,
      or: or ?? this.or,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'required': required,
      'or': or.map((x) => x.toMap()).toList(),
    };
  }

  factory RequestSecurity.fromMap(Map<String, dynamic> map) {
    return RequestSecurity(
      name: map['name'] as String,
      required: map['required'] as bool,
      or: List<RequestSecurity>.from(
        (map['or'] as List<int>).map<RequestSecurity>(
          (x) => RequestSecurity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestSecurity.fromJson(String source) =>
      RequestSecurity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RequestSecurity(name: $name, required: $required, or: $or)';

  @override
  bool operator ==(covariant RequestSecurity other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.required == required &&
        listEquals(other.or, or);
  }

  @override
  int get hashCode => name.hashCode ^ required.hashCode ^ or.hashCode;
}
