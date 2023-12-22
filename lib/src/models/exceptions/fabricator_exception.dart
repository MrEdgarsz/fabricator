class FabricatorException implements Exception {
  /// Creates a new instance of [FabricatorException].
  const FabricatorException(
    this.message, {
    this.stackTrace,
    this.cause,
  });

  /// The message of the exception.
  final String message;

  /// The stack trace of the exception.
  final StackTrace? stackTrace;

  /// The cause of the exception.
  final Object? cause;

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.writeln('FabricatorException: $message');
    if (cause != null) {
      buffer.writeln('Caused by: $cause');
    }
    if (stackTrace != null) {
      buffer.writeln(stackTrace);
    }
    return buffer.toString();
  }
}
