import 'package:auto_food/core/utils/app_strings.dart';
import 'package:equatable/equatable.dart';

abstract class BaseException extends Equatable implements Exception {
  final String? message;

  const BaseException({this.message});

  @override
  List<Object?> get props => [message];

  @override
  String toString() => '$message';
}

class CacheException extends BaseException {
  const CacheException({String? message})
      : super(message: AppStrings.cacheExceptionMessage);
}

class InputsException extends BaseException {
  const InputsException({String? message})
      : super(message: AppStrings.inputsExceptionMessage);
}


class NetworkException extends BaseException {
  const NetworkException({String? message})
      : super(message: AppStrings.networkExceptionMessage);
}

class ServerException extends BaseException {
  const ServerException({String? message})
      : super(message: AppStrings.serverExceptionMessage);
}

class UnauthorizedException extends BaseException {
  const UnauthorizedException({String? message})
      : super(message: AppStrings.unauthorizedExceptionMessage);
}

class UnknownException extends BaseException {
  const UnknownException({String? message})
      : super(message: AppStrings.unknownExceptionMessage);
}