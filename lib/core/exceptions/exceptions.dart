class RestApiException implements Exception {
  final int? statusCode;
  final String? message;
  const RestApiException({this.statusCode, this.message});
}

class EmptyException implements Exception {
}

class ConnectionException implements Exception {
}

class LogOutException implements Exception {
  final String message;
  LogOutException([this.message = 'exception_log_out_default']);
}


