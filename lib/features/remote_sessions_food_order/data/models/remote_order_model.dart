import 'package:auto_food/features/remote_sessions_food_order/data/models/user_model.dart';

class RemoteOrderModel {
  const RemoteOrderModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.price,
    required this.sessionId,
    required this.done,
  });

  final String id;
  final String userId;
  final String name;
  final double price;
  final String sessionId;
  final bool done;
}

class RemoteGetOrderInSessionModel {
  const RemoteGetOrderInSessionModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.price,
    required this.sessionId,
    required this.done,
    required this.user,
  });

  final String id;
  final String userId;
  final String name;
  final double price;
  final String sessionId;
  final bool done;
  final UserModel user;
}

class RemoteGetOrderModel {
  const RemoteGetOrderModel({
    required this.orders,
  });

  final List<RemoteGetOrderInSessionModel> orders;
}
