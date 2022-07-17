import 'package:auto_food/features/food_order/data/models/local_order_model.dart';

class LocalConclusionOrderModel {
  final double total;
  final double payed;
  final double remaining;
  final Map<String, Map<int, List<LocalOrderModel>>> orderCount;

  const LocalConclusionOrderModel({
    required this.total,
    required this.payed,
    required this.remaining,
    required this.orderCount,
  });

  factory LocalConclusionOrderModel.fromJson(Map<String, dynamic> json) =>
      LocalConclusionOrderModel(
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

class LocalConclusionUserModel {
  final double total;
  final double payed;
  final double remaining;
  final Map<String, List<LocalOrderModel>> userCount;

  const LocalConclusionUserModel({
    required this.total,
    required this.payed,
    required this.remaining,
    required this.userCount,
  });

  factory LocalConclusionUserModel.fromJson(Map<String, dynamic> json) =>
      LocalConclusionUserModel(
        total: json['total'] as double,
        payed: json['payed'] as double,
        remaining: json['remaining'] as double,
        userCount: json['userCount'] as Map<String, List<LocalOrderModel>>,
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'payed': payed,
        'remaining': remaining,
        'userCount': userCount,
      };
}
