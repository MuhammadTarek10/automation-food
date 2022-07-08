import 'package:auto_food/app.dart';
import 'package:auto_food/core/injector/injector.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp(const AutoOrderApp());
}
