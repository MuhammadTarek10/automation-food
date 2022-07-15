class AppStrings {
  static const String appName = "Food Order";
  static const String databaseName = "food_order.db";
  static const String empty = "Empty";

  // database
  static const int databaseVersion = 1;
  static const int orderModelDone = 1;
  static const int orderModelNotDone = 0;
  static const String databaseColId = "id";
  static const String databaseColName = "name";
  static const String databaseColOrder = "order";
  static const String databaseColPrice = "price";
  static const String databaseColPayed = "payed";
  static const String databaseColRemaining = "remaining";
  static const String databaseColDone = "done";
  static const String databaseTableName = "orders";

  // failure messages
  static const String cacheFailureMessage = "Cache Failure";
  static const String unexpectedFailureMessage = "Unexpected Failure";
  static const String serverFailureMessage = "Server Failure";
  static const String unauthorizedFailureMessage = "Unauthorized Failure";
  static const String noInternetFailureMessage = "No Internet Failure";
  static const String unknownFailureMessage = "Unknown Failure";

  // excetpotion messages
  static const String cacheExceptionMessage = "Cache Exception";
  static const String inputsExceptionMessage = "Inputs Exception";
  static const String networkExceptionMessage = "Network Exception";
  static const String serverExceptionMessage = "Server Exception";
  static const String unauthorizedExceptionMessage = "Unauthorized Exception";
  static const String noInternetExceptionMessage = "No Internet Exception";
  static const String unknownExceptionMessage = "Unknown Exception";

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
  static const String remainingHintText = "Remaining";
  static const String addOrderFloatingActionButtonTag = "ADD_ORDER";
  static const String getConclusionFloatingActionButtonTag = "GET_CONCLUSION";

  // dialog text buttons and content
  static const String addOrderButtonText = "Add Order";
  static const String cancelOrderButtonText = "Cancel";
  static const String saveOrderButtonText = "Save";
  static const String deleteOrderButtonText = "Delete";
  static const String deleteOrderTitle = "Delete Order";
  static const String deleteOrderContent =
      "Are you sure you want to delete this order?";
  static const String deleteAllOrdersTitle = "Delete All Orders";
  static const String deleteAllOrdersContent =
      "Are you sure you want to delete all orders?";

  // conclusion view
  static const String conclusionTitle = "Conclusion";
  static const String conclusionPayedText = "Payed";
  static const String conclusionRemainingText = "Remaining";
  static const String conclusionTotalText = "Total";
  static const String pieces = "pieces";
}
