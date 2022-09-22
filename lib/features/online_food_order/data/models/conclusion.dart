import 'package:auto_food/features/online_food_order/data/models/online_order.dart';
import 'package:auto_food/features/online_food_order/domain/entities/conclusion.dart';

class OnlineConclusionModel extends OnlineConclusion {
  const OnlineConclusionModel({
    required double total,
    required Map<String, Map<int, List<OnlineOrderModel>>> orders,
  }) : super(
          total: total,
          orders: orders,
        );

  factory OnlineConclusionModel.fromJson(Map<String, dynamic> json) {
    return OnlineConclusionModel(
      total: json['total'] as double,
      orders: json['orders'] as Map<String, Map<int, List<OnlineOrderModel>>>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'orders': orders,
    };
  }
}
