import 'package:auto_food/features/food_order/data/models/order_model.dart';

class ConclusionModel {
  final List<OrderModel> orders;

  const ConclusionModel({
    required this.orders,
  });

  factory ConclusionModel.fromJson(Map<String, dynamic> json) {
    return ConclusionModel(
      orders: OrderModel.fromJsonList(json['orders']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orders': orders.map((order) => order.toJson()).toList(),
    };
  }
}
