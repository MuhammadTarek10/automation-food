import 'package:auto_food/features/food_order/data/models/order_model.dart';

class ConclusionModel {
  final double total;
  final double payed;
  final double remaining;
  final Map<String, Map<int, List<OrderModel>>> orderCount;

  const ConclusionModel(
      {required this.total,
      required this.payed,
      required this.remaining,
      required this.orderCount});

  factory ConclusionModel.fromJson(Map<String, dynamic> json) =>
      ConclusionModel(
        total: json['total'] as double,
        payed: json['payed'] as double,
        remaining: json['remaining'] as double,
        orderCount: json['orderCount'] as Map<String, Map<int, List<OrderModel>>>,
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'payed': payed,
        'remaining': remaining,
        'orderCount': orderCount,
      };
}
