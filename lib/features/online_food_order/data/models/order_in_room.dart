import 'package:auto_food/features/online_food_order/domain/entities/order_in_room.dart';

class OrderInRoomModel extends OrderInRoom {
  OrderInRoomModel({
    required super.order,
    required super.user,
  });

  factory OrderInRoomModel.fromJson(Map<String, dynamic> json) =>
      OrderInRoomModel(
        order: json['order'],
        user: json['user'],
      );
}
