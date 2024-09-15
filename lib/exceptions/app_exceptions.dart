class AppExceptions implements Exception {
  final String message;
  const AppExceptions({required this.message});
}

/// [BadRequestException] is thrown for status code 400
class BadRequestException extends AppExceptions {
  BadRequestException({required super.message});
}

/// [BadRequestException] is thrown for status code 500
class InternalServerException extends AppExceptions {
  InternalServerException({required super.message});
}
