class ApiExpiredTokenException implements Exception {
  final String message;
  ApiExpiredTokenException(this.message);
}
