import 'package:auto_food/config/app_theme.dart';
import 'package:auto_food/config/routes.dart';
import 'package:flutter/material.dart';

class AutoOrderApp extends StatefulWidget {
  const AutoOrderApp({Key? key}) : super(key: key);

  @override
  State<AutoOrderApp> createState() => _AutoOrderAppState();
}

class _AutoOrderAppState extends State<AutoOrderApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getAppTheme(),
      onGenerateRoute: AppRouterGenerator.generateRoute,
    );
  }
}
