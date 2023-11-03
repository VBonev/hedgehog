import 'package:dio/dio.dart';

class ServerError implements Exception {
  ServerError({required this.errorMessage});

  ServerError.withError(Object? error) {
    if (error is DioException) {
      _handleError(error);
    } else {
      errorMessage = 'General error';
    }
  }

  String? errorMessage;

  String getErrorMessage() => errorMessage ?? '';

  String? _handleError(DioException? error) {
    switch (error?.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Request was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timeout';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'Connection failed due to internet connection';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive timeout in connection';
        break;
      case DioExceptionType.badResponse:
        errorMessage = 'Received bad response';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Receive timeout in send request';
        break;
      default:
        errorMessage = error?.message;
        break;
    }
    return errorMessage;
  }
}
