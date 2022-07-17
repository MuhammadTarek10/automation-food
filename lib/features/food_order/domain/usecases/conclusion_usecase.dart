import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/features/food_order/data/models/local_conclusion_model.dart';
import 'package:auto_food/features/food_order/domain/repositories/local_repository.dart';
import 'package:dartz/dartz.dart' show Either;

class GetConclusionByOrderUseCase
    implements UseCase<LocalConclusionOrderModel, NoParams> {
  final LocalRepository repository;

  const GetConclusionByOrderUseCase({required this.repository});

  Future<Either<Failure, LocalConclusionOrderModel>> call(
          NoParams params) async =>
      await repository.getConclusionByOrder();
}

class GetConclusionByUserUseCase
    implements UseCase<LocalConclusionUserModel, NoParams> {
  final LocalRepository repository;

  const GetConclusionByUserUseCase({required this.repository});

  Future<Either<Failure, LocalConclusionUserModel>> call(
          NoParams params) async =>
      await repository.getConclusionByUser();
}
