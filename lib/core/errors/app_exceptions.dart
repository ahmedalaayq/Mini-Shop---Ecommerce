abstract class AppException implements Exception {
  const AppException({required this.message});

  final String message;

  @override
  String toString() => '$runtimeType(message: $message)';
}
class ServerException extends AppException {
  const ServerException({required super.message});
}
class CacheException extends AppException {
  const CacheException({required super.message});
}
