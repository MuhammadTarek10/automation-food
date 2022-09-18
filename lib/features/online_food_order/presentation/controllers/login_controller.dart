import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/core/storage/app_pref.dart';
import 'package:auto_food/features/online_food_order/presentation/bloc/online_food_order_bloc.dart';

class LoginController {
  final AppPreference appPreference = instance<AppPreference>();

  final OnlineFoodOrderBloc bloc;
  LoginController({required this.bloc});

  void login(String email, String password) {
    bloc.add(LoginEvent(email: email, password: password));
  }

  void close() {
    bloc.close();
  }
}
