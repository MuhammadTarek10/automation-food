import 'dart:developer';

import 'package:auto_food/config/routes.dart';
import 'package:auto_food/core/utils/app_constants.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/bloc/remote_sessions_food_order_bloc.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final AuthController _controller;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _controller = AuthController(
        bloc: BlocProvider.of<RemoteSessionsFoodOrderBloc>(context));
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _controller.isLoggedIn().then(
      (isLoggedIn) {
        if (isLoggedIn) {
          Navigator.of(context).pushReplacementNamed(
            Routes.remoteSessionRoute,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoteSessionsFoodOrderBloc,
        RemoteSessionsFoodOrderState>(
      listener: (context, state) {
        log(state.toString());
        if (state is LoggedInSuccessfully) {
          Navigator.pushReplacementNamed(context, Routes.remoteSessionRoute);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.loginTitle,
          ),
        ),
        body: state is! TryingToLoginState
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: AppStrings.loginEmailLabelText,
                    ),
                  ),
                  const SizedBox(height: AppSizes.differenceBetweenTextFields),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: AppStrings.loginPasswordLabelText,
                    ),
                  ),
                  const SizedBox(height: AppSizes.differenceBetweenTextFields),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: state is RemoteSessionFoodOrderLoading
                          ? _loading()
                          : const Text(
                              AppStrings.loginButton,
                            ),
                      onPressed: () {
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        if (_controller.loginInputsValid(email, password)) {
                          _controller.login(email, password);
                        } else {
                          AppConstants.showToast(
                              message: AppStrings.invalidInputs);
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.dontHaveAccount),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.registerRoute,
                              (route) => false,
                            );
                          },
                          child: const Text(AppStrings.registerButton)),
                    ],
                  ),
                ],
              )
            : _allLoading(),
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  Widget _allLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
