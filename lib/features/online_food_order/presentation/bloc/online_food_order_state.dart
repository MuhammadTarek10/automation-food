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

class LoginFailedState extends OnlineFoodOrderState {
  final String message;

  const LoginFailedState({required this.message});
}

class RegisterFailedState extends OnlineFoodOrderState {
  final String message;

  const RegisterFailedState({required this.message});
}
