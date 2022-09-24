class AppStrings {
  static const String contactMe = "mohammadtarek000@gmail.com";
  static const String appName = "Food Order";
  static const String databaseName = "food_order.db";
  static const String empty = "Empty";
  static const String loading = "Loading";

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
  static const String unauthorizedFailureMessage = "Unauthorized";
  static const String noInternetFailureMessage = "No Internet Failure";
  static const String unknownFailureMessage = "Unknown Failure";
  static const String badRequestsFailureMessage = "Bad Requests Failure";
  static const String notFoundFailureMessage = "Not Found Failure";

  // sucess Messages
  static const String deletedSuccessMessage = "Deleted Successfully";
  static const String addedSuccessMessage = "Added Successfully";
  static const String editedSuccessMessage = "Edited Successfully";
  static const String joinedRoomSuccessfuly = "Joined Room Successfuly";

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
  static const String invalidCreditials = "Email or password is wrong";

  // cache keys
  static const String cacheKeyConclusion = "CONCLUSION";
  static const String cacheKeyOrders = "ORDERS";

  // udefined route
  static const String undefinedRoute = "Unexpected Error";

  // home view
  static const String goOnline = "Go Online";
  static const String goOffline = "Go Offline";

  // order view
  static const String enterOrderTitle = "Enter Order";
  static const String nameHintText = "Name";
  static const String orderHintText = "Order";
  static const String ordersHintText = "Orders";
  static const String priceHintText = "Price";
  static const String payedHintText = "Payed";
  static const String remainingHintText = "Remaining";
  static const String emptyOrdersText = "No Orders. To Add, press add button";
  static const String addOrderFloatingActionButtonTag = "ADD_ORDER";
  static const String getConclusionFloatingActionButtonTag = "GET_CONCLUSION";

  // dialog text buttons and content
  static const String addOrderButtonText = "Add Order";
  static const String addGroupOfOrdersButtonText = "Add Group Of Orders";
  static const String cancel = "Cancel";
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

  // rmeote session view
  static const int defaultRoomNumber = 1;
  static const String remoteSessionTitle = "Sessions";
  static const int remoteSessionApiTime = 5;

  // remote conclusion view

  // login
  static const String loginTitle = "Login";
  static const String loginEmailLabelText = "Email";
  static const String loginPasswordLabelText = "Password";
  static const String loginButton = "Login";
  static const String registerHereButton = "Register Here!";
  static const String dontHaveAccount = "Don't have an account?";

  // register
  static const String registerTitle = "Register";
  static const String registerButton = "Register";
  static const String registerNameLabelText = "Name";
  static const String registerEmailLabelText = "Email";
  static const String registerPasswordLabelText = "Password";
  static const String alreadyHaveAnAccount = "Already have an account?";
  static const String loginHereButton = "Login Here!";

  // online
  static const String roomViewTitle = "Your Rooms";
  static const String enterRoomDetailsTitle = "Enter Room Details";
  static const String roomNameHintText = "Room Name";
  static const String roomCodeHintText = "Room Code";
  static const String roomNumberHintText = "Number (Optional)";
  static const String createRoomButton = "Create Room";
  static const String enterRoomCode = "Join Room";
  static const String enterRoomCodeHintText = "Room Code";
  static const String joinRoomButton = "Join";

  static const String addOrderTitle = "Add Order";
  static const String orderNameHintText = "Order Name";
  static const String orderPriceHintText = "Price";

  static const String deleteRoom = "Delete Room";
  static const String deleteRoomContent =
      "Are you sure you want to delete this room?";
  static const String delete = "Delete";
}
