import 'package:auto_food/config/routes.dart';
import 'package:auto_food/core/utils/app_assets.dart';
import 'package:auto_food/core/utils/app_constants.dart';
import 'package:auto_food/core/utils/app_sizes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/core/utils/media_query_values.dart';
import 'package:auto_food/features/online_food_order/presentation/bloc/online_food_order_bloc.dart';
import 'package:auto_food/features/online_food_order/presentation/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final RegsiterController regsiterController;

  @override
  void initState() {
    super.initState();
    regsiterController =
        RegsiterController(bloc: context.read<OnlineFoodOrderBloc>());
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    regsiterController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnlineFoodOrderBloc, OnlineFoodOrderState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pushReplacementNamed(context, AppRoutes.onlineHomeRoute);
        } else if (state is RegisterFailedState) {
          AppConstants.showToast(message: state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.registerTitle),
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
                  AppAssets.regsiterImage,
                  height: context.height * AppRatio.registerImageHeight,
                ),
                SizedBox(height: context.width * AppRatio.sizedBox),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          context.height * AppRatio.paddingBetweenTextFields),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              context.width * AppRatio.borderRadiusTextField),
                        ),
                        labelText: AppStrings.nameHintText),
                  ),
                ),
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
                      AppStrings.registerButton,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.alreadyHaveAnAccount,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, AppRoutes.loginRoute),
                      child: const Text(AppStrings.loginHereButton),
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
    final name = nameController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      regsiterController.register(name, email, password);
    } else {
      AppConstants.showToast(message: AppStrings.invalidInputs);
    }
  }
}
