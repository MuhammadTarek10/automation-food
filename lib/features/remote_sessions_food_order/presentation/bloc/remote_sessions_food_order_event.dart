part of 'remote_sessions_food_order_bloc.dart';

abstract class RemoteSessionsFoodOrderEvent extends Equatable {
  const RemoteSessionsFoodOrderEvent();

  @override
  List<Object> get props => [];
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
  final RemoteSessionRequest request;

  const DeleteSessionEvent({required this.request});

  @override
  List<Object> get props => [request];
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
