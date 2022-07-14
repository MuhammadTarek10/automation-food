import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/features/food_order/data/models/local_conclusion_model.dart';
import 'package:auto_food/features/food_order/data/models/local_order_model.dart';
import 'package:dartz/dartz.dart' show Either;

abstract class LocalRepository {
  Future<Either<Failure, void>> saveOrder(LocalOrderModel order);
  Future<Either<Failure, void>> deleteOrder(LocalOrderModel order);
  Future<Either<Failure, void>> updateOrder(LocalOrderModel order);
  Future<Either<Failure, List<LocalOrderModel>>> getOrders();
  Future<Either<Failure, LocalConclusionModel>> getConclusion();
  Future<Either<Failure, void>> deleteAllOrders();
  Future<Either<Failure, void>> updateOrderDone(LocalOrderModel orderModel);
}
