class AppStrings {
  static const String appName = "Food Order";
  static const String databaseName = "food_order.db";
  static const String empty = "Empty";

  // database
  static const int databaseVersion = 1;
  static const String databaseColId = "id";
  static const String databaseColName = "name";
  static const String databaseColOrder = "order";
  static const String databaseColPrice = "price";
  static const String databaseColPayed = "payed";
  static const String databaseColRemaining = "remaining";
  static const String databaseTableName = "orders";

  // failure messages
  static const String cacheFailureMessage = "Cache Failure";
  static const String unexpectedFailureMessage = "Unexpected Failure";

  // excetpotion messages
  static const String cacheExceptionMessage = "Cache Exception";
  static const String inputsExceptionMessage = "Inputs Exception";

  // error toast messages
  static const String invalidInputs = "Invalid inputs";

  // cache keys
  static const String cacheKeyConclusion = "CONCLUSION";
  static const String cacheKeyOrders = "ORDERS";

  // udefined route
  static const String undefinedRoute = "Unexpected Error";

  // order view
  static const String enterOrderTitle = "Enter Order";
  static const String nameHintText = "Name";
  static const String orderHintText = "Order";
  static const String priceHintText = "Price";
  static const String payedHintText = "Payed";

  // dialog text buttons and content
  static const String addOrderButtonText = "Add Order";
  static const String cancelOrderButtonText = "Cancel";
  static const String deleteOrderButtonText = "Delete";
  static const String deleteOrderTitle = "Delete Order";
  static const String deleteOrderContent = "Are you sure you want to delete this order?";
  static const String deleteAllOrdersTitle = "Delete All Orders";
  static const String deleteAllOrdersContent = "Are you sure you want to delete all orders?";

  // conclusion view
}
