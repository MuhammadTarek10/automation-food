import 'package:auto_food/features/online_food_order/domain/entities/order.dart';
import 'package:auto_food/features/online_food_order/domain/entities/user.dart';

class OrderInRoom {
  final OnlineOrder order;
  final User user;

  const OrderInRoom({required this.order, required this.user});
}
