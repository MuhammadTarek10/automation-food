import 'package:auto_food/config/app_theme.dart';
import 'package:auto_food/config/routes.dart';
import 'package:flutter/material.dart';

class FoodOrderApp extends StatefulWidget {
  const FoodOrderApp({Key? key}) : super(key: key);

  @override
  State<FoodOrderApp> createState() => _FoodOrderAppState();
}

class _FoodOrderAppState extends State<FoodOrderApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getAppTheme(),
      onGenerateRoute: AppRouterGenerator.generateRoute,
    );
  }
}
