class NoAuthFoundException implements Exception {
  final String message;
  final String type;
  NoAuthFoundException(this.message, this.type);
}
