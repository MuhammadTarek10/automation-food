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


