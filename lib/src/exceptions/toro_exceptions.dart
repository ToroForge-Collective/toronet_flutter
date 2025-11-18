/// Base exception class for all Toronet SDK exceptions
class ToroSDKException implements Exception {
  final String message;
  final dynamic originalError;

  ToroSDKException(this.message, [this.originalError]);

  @override
  String toString() => 'ToroSDKException: $message';
}

/// Exception thrown when there's a network-related error
class NetworkException extends ToroSDKException {
  NetworkException(super.message, [super.originalError]);

  @override
  String toString() => 'NetworkException: $message';
}

/// Exception thrown when there's an API error response
class APIException extends ToroSDKException {
  final int? statusCode;
  final Map<String, dynamic>? errorData;

  APIException(
    super.message, [
    this.statusCode,
    this.errorData,
    super.originalError,
  ]);

  @override
  String toString() =>
      'APIException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
}

/// Exception thrown when validation fails
class ValidationException extends ToroSDKException {
  ValidationException(super.message, [super.originalError]);

  @override
  String toString() => 'ValidationException: $message';
}

/// Exception thrown when authentication fails
class AuthenticationException extends ToroSDKException {
  AuthenticationException(super.message, [super.originalError]);

  @override
  String toString() => 'AuthenticationException: $message';
}
