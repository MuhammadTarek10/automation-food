part of 'online_food_order_bloc.dart';

abstract class OnlineFoodOrderEvent extends Equatable {
  const OnlineFoodOrderEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends OnlineFoodOrderEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class RegisterEvent extends OnlineFoodOrderEvent {
  final String name;
  final String email;
  final String password;

  const RegisterEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        name,
        email,
        password,
      ];
}

class GetRoomsEvent extends OnlineFoodOrderEvent {}

class GetRoomEvent extends OnlineFoodOrderEvent {
  @override
  List<Object> get props => [];
}

class CreateRoomEvent extends OnlineFoodOrderEvent {
  final String name;
  final String code;
  final int? number;

  const CreateRoomEvent({
    required this.name,
    required this.code,
    this.number,
  });
}

class AddOnlineOrderEvent extends OnlineFoodOrderEvent {
  final String name;
  final double price;

  const AddOnlineOrderEvent({
    required this.name,
    required this.price,
  });
}

class DeleteRoomEvent extends OnlineFoodOrderEvent {}

class SearchRoomEvent extends OnlineFoodOrderEvent {}

class GetRoomOrdersEvent extends OnlineFoodOrderEvent {}

class DeleteOnlineOrderEvent extends OnlineFoodOrderEvent {
  final String id;

  const DeleteOnlineOrderEvent({
    required this.id,
  });
}

class GetConclusionEvent extends OnlineFoodOrderEvent {
  final List<OrderInRoom> orders;

  const GetConclusionEvent({
    required this.orders,
  });

  @override
  List<Object> get props => [orders];
}
