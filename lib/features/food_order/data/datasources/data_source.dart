import 'package:auto_food/features/food_order/data/models/conclusion_model.dart';
import 'package:auto_food/features/food_order/data/models/order_model.dart';

abstract class DataSource {
  Future<void> saveOrder(OrderModel orders);
  Future<List<OrderModel>> getOrders();
  Future<void> deleteOrder(OrderModel order);
  Future<void> updateOrder(OrderModel order);
  Future<void> deleteAllOrders();
  Future<ConclusionModel> getConclusion();
}
