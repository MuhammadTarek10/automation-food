import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_login_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_registration_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/bloc/remote_sessions_food_order_bloc.dart';

class LoginController {
  final RemoteSessionsFoodOrderBloc bloc;
  const LoginController({required this.bloc});

  bool loginInputsValid(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty;
  }

  void login(String email, String password) {
    bloc.add(LoginEvent(model: LoginModel(email: email, password: password)));
  }

  void register(String name, String email, String password) {
    bloc.add(
      RegisterEvent(
        model:
            RemoteRegisterModel(name: name, email: email, password: password),
      ),
    );
  }
}
