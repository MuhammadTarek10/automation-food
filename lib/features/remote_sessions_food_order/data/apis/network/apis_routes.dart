class ApiRoutes {
  static const String base = "/api";
  // auth
  static const String baseAuth = "$base/auth";
  static const String login = "$baseAuth/login";
  static const String register = "$baseAuth/register";

  // session
  static const String baseSession = "$base/session";
  static const String getSessions = "$baseSession/get-sessions";
  static const String createSession = "$baseSession/create-session";
  static const String searchSession = "$baseSession/search-session";
  static const String deleteSession = "$baseSession/delete-session";

  // order
  static const String baseOrder = "$base/order";
  static const String getOrders = "$baseOrder/get-orders";
  static const String addOrder = "$baseOrder/add-order";
  static const String deleteOrder = "$baseOrder/delete-order";
  static const String editOrder = "$baseOrder/edit-order";

  // conclusion
  static const String baseConclusion = "$base/conclusion";
  static const String getConclusion = "$baseConclusion/get-conclusion";
}
