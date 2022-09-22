import 'package:auto_food/features/online_food_order/domain/entities/order.dart';
import 'package:equatable/equatable.dart';

class OnlineConclusion extends Equatable {
  final double total;
  final Map<String, Map<int, List<OnlineOrder>>> orders;

  const OnlineConclusion({
    required this.total,
    required this.orders,
  });

  @override
  List<Object?> get props => [
        total,
        orders,
      ];
}
