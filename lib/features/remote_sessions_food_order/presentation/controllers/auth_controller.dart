
import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/core/storage/app_pref.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/requests/requests.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/bloc/remote_sessions_food_order_bloc.dart';

class AuthController {
  final RemoteSessionsFoodOrderBloc bloc;
  final AppPreference _preference = instance<AppPreference>();
  AuthController({required this.bloc});

  bool loginInputsValid(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty;
  }

  Future<bool> isLoggedIn() async {
    bloc.add(TryingToLoginEvent());
    final email = await _preference.getUserEmail();
    final password = await _preference.getUserPassword();
    if (email != null && password != null) {
      if (autoLogin(email, password)) {
        return true;
      }
    }
    loggout();
    bloc.add(LoggedOutEvent());
    return false;
  }

  Future<void> loggout() async {
    return await _preference.removeAll();
  }

  bool login(String email, String password) {
    bloc.add(
        LoginEvent(request: LoginRequest(email: email, password: password)));
    return bloc.state is LoggedInSuccessfully;
  }

  bool autoLogin(String email, String passwrd) {
    bloc.add(
      AutomatedLoginEvent(
        request: LoginRequest(email: email, password: passwrd),
      ),
    );
    return bloc.state is LoggedInSuccessfully;
  }

  bool registerInputsValid(
      String email, String password, String confirmPassword) {
    return email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty;
  }

  void register(String name, String email, String password) {
    bloc.add(
      RegisterEvent(
        request: RegisterRequest(name: name, email: email, password: password),
      ),
    );
  }
}
