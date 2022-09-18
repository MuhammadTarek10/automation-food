import 'package:auto_food/config/routes.dart';
import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/core/storage/app_pref.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AppPreference appPreference = instance<AppPreference>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.localOrderRoute);
              },
              child: const Text(AppStrings.goOffline),
            ),
            ElevatedButton(
              onPressed: () async {
                appPreference.isLoggedIn().then((isLoggedIn) {
                  if (isLoggedIn) {
                    Navigator.pushNamed(context, AppRoutes.onlineHomeRoute);
                  } else {
                    Navigator.pushNamed(context, AppRoutes.loginRoute);
                  }
                });
              },
              child: const Text(AppStrings.goOnline),
            ),
          ],
        ),
      ),
    );
  }
}
