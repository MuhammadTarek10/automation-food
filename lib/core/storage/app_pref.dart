import 'package:auto_food/core/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  final SharedPreferences sharedPreferences;
  const AppPreference({required this.sharedPreferences});

  Future<void> setUser(String email, String password) async {
    await sharedPreferences.setString(AppConstants.emailKey, email);
    await sharedPreferences.setString(AppConstants.passwordKey, password);
  }

  Future<String?> getUserEmail() async {
    return sharedPreferences.getString(AppConstants.emailKey);
  }

  Future<String?> getUserPassword() async {
    return sharedPreferences.getString(AppConstants.passwordKey);
  }

  Future<void> setToken(String token) async {
    await sharedPreferences.setString(AppConstants.tokenKey, token);
  }

  Future<String?> getToken() async {
    return sharedPreferences.getString(AppConstants.tokenKey);
  }

  Future<void> setUserId(String userId) async {
    await sharedPreferences.setString(AppConstants.userIdKey, userId);
  }

  Future<String?> getUserId() async {
    return sharedPreferences.getString(AppConstants.userIdKey);
  }

  Future<void> clear() async {
    await sharedPreferences.clear();
  }

  Future<void> removeAll() async {
    await sharedPreferences.clear();
  }

  Future<void> loggout() async {
    await removeAll();
  }
}
