import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/features/food_order/data/models/conclusion_model.dart';
import 'package:auto_food/features/food_order/data/models/order_model.dart';
import 'package:dartz/dartz.dart' show Either;

abstract class Repository {
  Future<Either<Failure, void>> saveOrder(OrderModel order);
  Future<Either<Failure, void>> deleteOrder(OrderModel order);
  Future<Either<Failure, void>> updateOrder(OrderModel order);
  Future<Either<Failure, List<OrderModel>>> getOrders();
  Future<Either<Failure, ConclusionModel>> getConclusion();
  Future<Either<Failure, void>> deleteAllOrders();
}
