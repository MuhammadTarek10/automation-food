part of 'remote_sessions_food_order_bloc.dart';

abstract class RemoteSessionsFoodOrderState extends Equatable {
  const RemoteSessionsFoodOrderState();

  @override
  List<Object> get props => [];
}

class RemoteSessionsFoodOrderInitial extends RemoteSessionsFoodOrderState {}

class RemoteSessionFoodOrderLoading extends RemoteSessionsFoodOrderState {}

class LoggedInSuccessfully extends RemoteSessionsFoodOrderState {
  final String token;

  const LoggedInSuccessfully({required this.token});

  @override
  List<Object> get props => [token];
}

class LoggedInFailed extends RemoteSessionsFoodOrderState {
  final String message;

  const LoggedInFailed({required this.message});

  @override
  List<Object> get props => [message];
}
