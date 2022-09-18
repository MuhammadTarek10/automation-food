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
