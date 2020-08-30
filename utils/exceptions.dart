/// Custom [Exception] used to pass API messages to the user
class ApiException implements Exception {
  /// Creates an ApiException with the given message
  const ApiException({
    this.message = 'Something went wrong, please try again',
    this.code,
  });

  /// The message to be displayed to the user
  /// Defaults to "Something went wrong, please try again"
  final String message;

  /// Optional error code returned by the API
  final String code;

  @override
  String toString() => 'ApiException: $message';
}

class InvalidTokenException implements Exception {
  const InvalidTokenException();

  @override
  String toString() => 'InvalidTokenException: Token is invalid';
}
