class BusinessException implements Exception {
  String cause;

  BusinessException(this.cause);

  @override
  String toString() {
    return cause;
  }
}