part of 'remote_sessions_food_order_bloc.dart';

abstract class RemoteSessionsFoodOrderState extends Equatable {
  const RemoteSessionsFoodOrderState();

  @override
  List<Object> get props => [];
}

class RemoteSessionsFoodOrderInitial extends RemoteSessionsFoodOrderState {}

class RemoteSessionFoodOrderLoading extends RemoteSessionsFoodOrderState {}

// auth
class LoggedInSuccessfully extends RemoteSessionsFoodOrderState {
  final String token;

  const LoggedInSuccessfully({required this.token});

  @override
  List<Object> get props => [token];
}

class TryingToLoginState extends RemoteSessionsFoodOrderState {}

class AutomatedLoginState extends RemoteSessionsFoodOrderState {}

class LoggedOutState extends RemoteSessionsFoodOrderState {}

class LoggedInFailed extends RemoteSessionsFoodOrderState {
  final String message;

  const LoggedInFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class RegisterFailed extends RemoteSessionsFoodOrderState {
  final String message;

  const RegisterFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class RegisterSuccessfully extends RemoteSessionsFoodOrderState {
  final RemoteUserModel user;

  const RegisterSuccessfully({required this.user});

  @override
  List<Object> get props => [user];
}

// session
class GetSessionsSuccessfully extends RemoteSessionsFoodOrderState {
  final List<RemoteSessionModel> sessions;

  const GetSessionsSuccessfully({required this.sessions});

  @override
  List<Object> get props => [sessions];
}

class SessionFaildShouldLoggout extends RemoteSessionsFoodOrderState {}

class GetSessionsFailed extends RemoteSessionsFoodOrderState {
  final String message;

  const GetSessionsFailed({required this.message});

  @override
  List<Object> get props => [message];
}
