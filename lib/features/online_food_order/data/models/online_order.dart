import 'package:auto_food/features/online_food_order/domain/entities/order.dart';

class OnlineOrderModel extends OnlineOrder {
  const OnlineOrderModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.price,
    required super.roomId,
    required super.done,
  });

  factory OnlineOrderModel.fromJson(Map<String, dynamic> json) =>
      OnlineOrderModel(
        id: json['id'],
        userId: json['user_id'],
        roomId: json["room_id"],
        name: json["name"],
        price: json["price"],
        done: json["done"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_id": userId,
        "room_id": roomId,
        "name": name,
        "price": price,
        "done": done,
      };
}
