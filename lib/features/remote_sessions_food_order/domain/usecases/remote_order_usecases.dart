import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/requests/requests.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_order_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/domain/repositories/remote_repository.dart';
import 'package:dartz/dartz.dart' show Either;

class RemoteGetOtderUseCase
    implements UseCase<List<RemoteGetOrderInSessionModel>, String> {
  final RemoteRepository repository;
  const RemoteGetOtderUseCase({required this.repository});
  Future<Either<Failure, List<RemoteGetOrderInSessionModel>>> call(
          String params) async =>
      await repository.getOrders(params);
}

class RemoteAddOrderUseCase
    implements UseCase<RemoteOrderModel, RemoteOrderRequest> {
  final RemoteRepository repository;
  const RemoteAddOrderUseCase({required this.repository});
  Future<Either<Failure, RemoteOrderModel>> call(
          RemoteOrderRequest params) async =>
      await repository.addOrder(params);
}

class RemoteDeleteOrderUseCase
    implements UseCase<RemoteOrderModel, RemoteOrderRequest> {
  final RemoteRepository repository;
  const RemoteDeleteOrderUseCase({required this.repository});
  Future<Either<Failure, RemoteOrderModel>> call(
          RemoteOrderRequest params) async =>
      await repository.deleteOrder(params);
}

class RemoteEditOrderUseCase
    implements UseCase<RemoteOrderModel, RemoteOrderRequest> {
  final RemoteRepository repository;
  const RemoteEditOrderUseCase({required this.repository});
  Future<Either<Failure, RemoteOrderModel>> call(
          RemoteOrderRequest params) async =>
      await repository.editOrder(params);
}
