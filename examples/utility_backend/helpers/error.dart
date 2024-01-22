class BackendError {
  const BackendError({
    required this.message,
    this.code = 200,
  });

  final String message;
  final int code;

  Map<String, Object> toJson() {
    return {
      'message': message,
      'code': code,
    };
  }

  String toBody() {
    return toJson().toString();
  }

  @override
  String toString() {
    return 'BackendError{message: $message, code: $code}';
  }
}
