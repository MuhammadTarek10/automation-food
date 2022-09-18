class ApiRoutes {
  static const String base = "/api";

  // auth
  static const String baseAuth = "$base/auth";
  static const String login = "$baseAuth/login";
  static const String register = "$baseAuth/register";

  // room
  static const String baseRoom = "$base/room";
  static const String getRooms = "$baseRoom/get-room";
  static const String createRoom = "$baseRoom/create-room";
  static const String searchRoom = "$baseRoom/search-room";
  static const String deleteRoom = "$baseRoom/delete-room";

  // order
  static const String baseOrder = "$base/order";
  static const String getOrders = "$baseOrder/get-orders";
  static const String addOrder = "$baseOrder/add-order";
  static const String deleteOrder = "$baseOrder/delete-order";
  static const String editOrder = "$baseOrder/edit-order";
}
