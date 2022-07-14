import 'package:auto_food/features/food_order/data/models/local_conclusion_model.dart';
import 'package:auto_food/features/food_order/data/models/local_order_model.dart';

abstract class DataSource {
  Future<void> saveOrder(LocalOrderModel orders);
  Future<List<LocalOrderModel>> getOrders();
  Future<void> deleteOrder(LocalOrderModel order);
  Future<void> updateOrder(LocalOrderModel order);
  Future<void> deleteAllOrders();
  Future<LocalConclusionModel> getConclusion();
  Future<void> updateOrderDone(LocalOrderModel orderModel);
}
