import 'package:auto_food/config/routes.dart';
import 'package:auto_food/core/utils/app_constants.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/bloc/remote_sessions_food_order_bloc.dart';
import 'package:auto_food/features/remote_sessions_food_order/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<RegisterView> {
  late final AuthController _controller;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _controller = AuthController(
        bloc: BlocProvider.of<RemoteSessionsFoodOrderBloc>(context));
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoteSessionsFoodOrderBloc,
        RemoteSessionsFoodOrderState>(
      listener: (context, state) {
        if (state is RegisterSuccessfully) {
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
        } else if (state is RegisterFailed) {
          AppConstants.showToast(message: state.message);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.registerTitle,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: AppStrings.registerNameLabelText,
              ),
            ),
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
                          AppStrings.registerButton,
                        ),
                  onPressed: () {
                    final name = _nameController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    if (_controller.registerInputsValid(
                        name, email, password)) {
                      _controller.register(name, email, password);
                    } else {
                      AppConstants.showToast(message: AppStrings.invalidInputs);
                    }
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(AppStrings.alreadyHaveAnAccount),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.loginRoute,
                        (route) => false,
                      );
                    },
                    child: const Text(AppStrings.loginHereButton)),
              ],
            )
          ],
        ),
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
}
