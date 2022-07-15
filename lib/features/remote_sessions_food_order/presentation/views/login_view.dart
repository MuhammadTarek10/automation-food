import 'package:auto_food/config/routes.dart';
import 'package:auto_food/core/utils/app_constants.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/bloc/remote_sessions_food_order_bloc.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginController _controller;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _controller = LoginController(
        bloc: BlocProvider.of<RemoteSessionsFoodOrderBloc>(context));
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RemoteSessionsFoodOrderBloc,
        RemoteSessionsFoodOrderState>(
      listener: (context, state) {
        if (state is LoggedInSuccessfully) {
          Navigator.pushReplacementNamed(context, Routes.remoteSessionRoute);
        } else if (state is LoggedInFailed) {
          AppConstants.showToast(message: state.message);
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;
                if (_controller.loginInputsValid(email, password)) {
                  _controller.login(email, password);
                } else {
                  AppConstants.showToast(message: AppStrings.invalidInputs);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
