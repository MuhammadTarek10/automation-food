import 'package:auto_food/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppConstants {
  // static const String baseUrl = "localhost:3030";
  static const String baseUrl = "https://tarek-auto-food.herokuapp.com/";
  static const String tokenKey = "TOKEN_KEY";
  static const String userIdKey = "USER_ID_KEY";
  static const String emailKey = "EMAIL";
  static const String passwordKey = "PASSWORD";
  static const String cotnentType = "Content-Type";
  static const String applicationJson = "application/json";
  static const String accept = "Accept";
  static const String authorization = "x-auth-token";

  static const int recieveTimeout = 10000;
  static const int connectTimeout = 10000;
  static const int sendTimeout = 10000;

  static void showToast({
    required String message,
    Color? color,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: color ?? AppColors.hint,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }
}
