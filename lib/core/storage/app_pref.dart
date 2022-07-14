import 'package:auto_food/core/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  final SharedPreferences sharedPreferences;
  const AppPreference({required this.sharedPreferences});

  Future<void> setToken(String token) async {
    await sharedPreferences.setString(AppConstants.tokenKey, token);
  }

  Future<String?> getToken() async {
    return sharedPreferences.getString(AppConstants.tokenKey);
  }
}
