part of 'online_food_order_bloc.dart';

abstract class OnlineFoodOrderState extends Equatable {
  const OnlineFoodOrderState();

  @override
  List<Object> get props => [];
}

class OnlineFoodOrderInitial extends OnlineFoodOrderState {}

class LoginSuccessState extends OnlineFoodOrderState {
  final User user;

  const LoginSuccessState({
    required this.user,
  });
}

class RegisterSuccessState extends OnlineFoodOrderState {}

class OnlineLoading extends OnlineFoodOrderState {}

class FailedState extends OnlineFoodOrderState {
  final String message;

  const FailedState({required this.message});
}

class GetRoomsSuccessState extends OnlineFoodOrderState {
  final List<OnlineRoom> rooms;

  const GetRoomsSuccessState({required this.rooms});

  @override
  List<Object> get props => [
        rooms,
      ];
}

class GenericSuccessState extends OnlineFoodOrderState {}

class GetRoomOrdersSuccess extends OnlineFoodOrderState {
  final List<OrderInRoom> orders;

  const GetRoomOrdersSuccess({required this.orders});
  @override
  List<Object> get props => [
        orders,
      ];
}