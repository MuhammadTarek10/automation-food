part of 'remote_sessions_food_order_bloc.dart';

abstract class RemoteSessionsFoodOrderEvent extends Equatable {
  const RemoteSessionsFoodOrderEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends RemoteSessionsFoodOrderEvent {
  final LoginModel model;

  const LoginEvent({required this.model});

  @override
  List<Object> get props => [model];
}

class RegisterEvent extends RemoteSessionsFoodOrderEvent {
  final RemoteRegisterModel model;

  const RegisterEvent({required this.model});

  @override
  List<Object> get props => [model];
}

class GetSessionsEvent extends RemoteSessionsFoodOrderEvent {}

class CreateSessionEvent extends RemoteSessionsFoodOrderEvent {
  final RemoteSessionRequest request;

  const CreateSessionEvent({required this.request});

  @override
  List<Object> get props => [request];
}

class SearchSessionEvent extends RemoteSessionsFoodOrderEvent {
  final String sessionId;

  const SearchSessionEvent({required this.sessionId});

  @override
  List<Object> get props => [sessionId];
}

class DeleteSessionEvent extends RemoteSessionsFoodOrderEvent {
  final String sessionId;

  const DeleteSessionEvent({required this.sessionId});

  @override
  List<Object> get props => [sessionId];
}

class GetOrdersEvent extends RemoteSessionsFoodOrderEvent {
  final String sessionId;

  const GetOrdersEvent({required this.sessionId});

  @override
  List<Object> get props => [sessionId];
}

class AddOrderEvent extends RemoteSessionsFoodOrderEvent {
  final RemoteOrderRequest request;

  const AddOrderEvent({required this.request});

  @override
  List<Object> get props => [request];
}

class DeleteOrderEvent extends RemoteSessionsFoodOrderEvent {
  final RemoteOrderRequest request;

  const DeleteOrderEvent({required this.request});

  @override
  List<Object> get props => [request];
}

class EditOrderEvent extends RemoteSessionsFoodOrderEvent {
  final RemoteOrderRequest request;

  const EditOrderEvent({required this.request});

  @override
  List<Object> get props => [request];
}

class GetConclusionEvent extends RemoteSessionsFoodOrderEvent {
  final String sessionId;

  const GetConclusionEvent({required this.sessionId});

  @override
  List<Object> get props => [sessionId];
}
