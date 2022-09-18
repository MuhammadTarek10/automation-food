import 'package:auto_food/config/routes.dart';
import 'package:auto_food/core/utils/app_assets.dart';
import 'package:auto_food/core/utils/app_constants.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/online_food_order/presentation/bloc/online_food_order_bloc.dart';
import 'package:auto_food/features/online_food_order/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final LoginController loginController;

  @override
  void initState() {
    super.initState();
    loginController =
        LoginController(bloc: context.read<OnlineFoodOrderBloc>());
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    loginController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnlineFoodOrderBloc, OnlineFoodOrderState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushReplacementNamed(context, AppRoutes.onlineHomeRoute);
        } else if (state is LoginFailedState) {
          AppConstants.showToast(message: state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.loginTitle),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.width * AppRatio.defaultPaddingWithHeight,
              vertical: context.height * AppRatio.defaultPaddingWithHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.loginImage,
                  height: context.height * AppRatio.loginImageHeight,
                ),
                SizedBox(height: context.width * AppRatio.sizedBox),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          context.height * AppRatio.paddingBetweenTextFields),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              context.width * AppRatio.borderRadiusTextField),
                        ),
                        labelText: AppStrings.loginEmailLabelText),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          context.height * AppRatio.paddingBetweenTextFields),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              context.width * AppRatio.borderRadiusTextField),
                        ),
                        labelText: AppStrings.loginPasswordLabelText),
                  ),
                ),
                InkWell(
                  onTap: () => checkInputs(),
                  child: Container(
                    width: double.infinity,
                    height: context.height * AppRatio.loginButtonHeight,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(
                          context.width * AppRatio.borderButtonRadius),
                    ),
                    child: Text(
                      AppStrings.loginButton,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.dontHaveAccount,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, AppRoutes.registerRoute),
                      child: const Text(AppStrings.registerHereButton),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkInputs() {
    final email = emailController.text;
    final password = passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      loginController.login(email, password);
    } else {
      AppConstants.showToast(message: AppStrings.invalidInputs);
    }
  }
}
