import 'package:fabricator_builder/src/models/models.dart';
import 'package:flutter/foundation.dart';

class RequestBody {
  RequestBody({required this.required, required this.content});

  final bool required;
  final Map<String, MediaType> content;

  @override
  bool operator ==(covariant RequestBody other) {
    if (identical(this, other)) return true;

    return other.required == required && mapEquals(other.content, content);
  }

  @override
  int get hashCode => required.hashCode ^ content.hashCode;

  @override
  String toString() => 'RequestBody(required: $required, content: $content)';
}
