import 'package:auto_food/core/utils/app_strings.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get getMessage;
}

class CacheFailure extends Failure {
  final String message = AppStrings.cacheFailureMessage;

  @override
  String get getMessage => message;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  final String message = AppStrings.serverFailureMessage;

  @override
  String get getMessage => message;

  @override
  List<Object?> get props => [message];
}

class UnauthorizedFailure extends Failure {
  final String message = AppStrings.unauthorizedFailureMessage;

  @override
  String get getMessage => message;

  @override
  List<Object?> get props => [message];
}

class NoInternetFailure extends Failure {
  final String message = AppStrings.noInternetFailureMessage;

  @override
  String get getMessage => message;

  @override
  List<Object?> get props => [message];
}

class UnknownFailure extends Failure {
  final String message = AppStrings.unknownFailureMessage;

  @override
  String get getMessage => message;

  @override
  List<Object?> get props => [message];
}
