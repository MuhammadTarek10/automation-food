class ApiRoutes {
  static const String base = "/api";

  // auth
  static const String baseAuth = "$base/auth";
  static const String login = "$baseAuth/login";
  static const String register = "$baseAuth/register";

  // room
  static const String baseRoom = "$base/room";
  static const String getRooms = "$baseRoom/get-rooms/{id}";
  static const String createRoom = "$baseRoom/create-room/{id}";
  static const String searchRoom = "$baseRoom/search-room/{id}";
  static const String deleteRoom = "$baseRoom/delete-room/{id}";

  // order
  static const String baseOrder = "$base/order";
  static const String getOrders = "$baseOrder/get-orders/{id}/{room_id}";
  static const String addOrder = "$baseOrder/add-order/{id}";
  static const String deleteOrder = "$baseOrder/delete-order/{id}";
  static const String editOrder = "$baseOrder/edit-order/{id}";
}
