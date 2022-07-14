import 'package:auto_food/core/utils/app_constants.dart';

class ApiRoutes {
  static const String base = "${AppConstants.baseUrl}/api";
  // auth
  static const String login = "$base/login";
  static const String register = "$base/register";

  // session
  static const String getSessions = "$base/get-sessions";
  static const String createSession = "$base/create-session";
  static const String searchSession = "$base/search-session";
  static const String deleteSession = "$base/delete-session";

  // order
  static const String getOrders = "$base/get-orders";
  static const String addOrder = "$base/add-order";
  static const String deleteOrder = "$base/delete-order";
  static const String editOrder = "$base/edit-order";

  // conclusion
  static const String getConclusion = "$base/get-conclusion";
}
