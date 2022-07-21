class NoAuthFoundException implements Exception {
  final String message;
  NoAuthFoundException(this.message);
}
