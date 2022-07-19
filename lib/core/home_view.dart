import 'package:auto_food/config/routes.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.contactMe),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.localOrderRoute);
              },
              child: const Text(AppStrings.goOffline),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.loginRoute);
              },
              child: const Text(AppStrings.goOnline),
            ),
          ],
        ),
      ),
    );
  }
}
