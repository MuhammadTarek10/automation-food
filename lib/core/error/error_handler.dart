import 'package:auto_food/core/error/failures.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  static Failure handle(DioError error) {
    if (error.response != null) {
      switch (error.response!.statusCode) {
        case 400:
          return BadRequestFailure();
        case 401:
          return UnauthorizedFailure();
        case 404:
          return NotFoundFailure();
        case 500:
          return ServerFailure();
        default:
          return UnknownFailure();
      }
    } else {
      return UnknownFailure();
    }
  }
}
