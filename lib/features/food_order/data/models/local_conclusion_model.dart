import 'package:auto_food/features/food_order/data/models/local_order_model.dart';

class LocalConclusionModel {
  final double total;
  final double payed;
  final double remaining;
  final Map<String, Map<int, List<LocalOrderModel>>> orderCount;

  const LocalConclusionModel(
      {required this.total,
      required this.payed,
      required this.remaining,
      required this.orderCount});

  factory LocalConclusionModel.fromJson(Map<String, dynamic> json) =>
      LocalConclusionModel(
        total: json['total'] as double,
        payed: json['payed'] as double,
        remaining: json['remaining'] as double,
        orderCount:
            json['orderCount'] as Map<String, Map<int, List<LocalOrderModel>>>,
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'payed': payed,
        'remaining': remaining,
        'orderCount': orderCount,
      };
}
