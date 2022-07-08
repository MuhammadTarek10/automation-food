import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/features/food_order/data/models/order_model.dart';
import 'package:auto_food/features/food_order/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart' show Either;

class SaveOrderUseCase implements UseCase<void, OrderModel> {
  final Repository repository;
  const SaveOrderUseCase({required this.repository});
  Future<Either<Failure, void>> call(OrderModel params) async =>
      await repository.saveOrder(params);
}

class DeleteOrderUseCase implements UseCase<void, OrderModel> {
  final Repository repository;
  const DeleteOrderUseCase({required this.repository});
  Future<Either<Failure, void>> call(OrderModel params) async =>
      await repository.deleteOrder(params);
}

class GetOrdersUseCase implements UseCase<List<OrderModel>, NoParams> {
  final Repository repository;
  const GetOrdersUseCase({required this.repository});
  Future<Either<Failure, List<OrderModel>>> call(NoParams params) async =>
      await repository.getOrders();
}

class DeleteAllOrdersUseCase implements UseCase<void, NoParams> {
  final Repository repository;
  const DeleteAllOrdersUseCase({required this.repository});
  Future<Either<Failure, void>> call(NoParams params) async =>
      await repository.deleteAllOrders();
}


class UpdateOrderUseCase implements UseCase<void, OrderModel> {
  final Repository repository;
  const UpdateOrderUseCase({required this.repository});
  Future<Either<Failure, void>> call(OrderModel params) async =>
      await repository.updateOrder(params);
}