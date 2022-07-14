import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/features/food_order/data/models/local_order_model.dart';
import 'package:auto_food/features/food_order/domain/repositories/local_repository.dart';
import 'package:dartz/dartz.dart' show Either;

class SaveOrderUseCase implements UseCase<void, LocalOrderModel> {
  final LocalRepository repository;
  const SaveOrderUseCase({required this.repository});
  Future<Either<Failure, void>> call(LocalOrderModel params) async =>
      await repository.saveOrder(params);
}

class DeleteOrderUseCase implements UseCase<void, LocalOrderModel> {
  final LocalRepository repository;
  const DeleteOrderUseCase({required this.repository});
  Future<Either<Failure, void>> call(LocalOrderModel params) async =>
      await repository.deleteOrder(params);
}

class GetOrdersUseCase implements UseCase<List<LocalOrderModel>, NoParams> {
  final LocalRepository repository;
  const GetOrdersUseCase({required this.repository});
  Future<Either<Failure, List<LocalOrderModel>>> call(NoParams params) async =>
      await repository.getOrders();
}

class DeleteAllOrdersUseCase implements UseCase<void, NoParams> {
  final LocalRepository repository;
  const DeleteAllOrdersUseCase({required this.repository});
  Future<Either<Failure, void>> call(NoParams params) async =>
      await repository.deleteAllOrders();
}

class UpdateOrderUseCase implements UseCase<void, LocalOrderModel> {
  final LocalRepository repository;
  const UpdateOrderUseCase({required this.repository});
  Future<Either<Failure, void>> call(LocalOrderModel params) async =>
      await repository.updateOrder(params);
}

class UpdateOrderDoneUseCase implements UseCase<void, LocalOrderModel> {
  final LocalRepository repository;
  const UpdateOrderDoneUseCase({required this.repository});
  Future<Either<Failure, void>> call(LocalOrderModel params) async =>
      await repository.updateOrderDone(params);
}
