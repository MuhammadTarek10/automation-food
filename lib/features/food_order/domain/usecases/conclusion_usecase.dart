import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/features/food_order/data/models/conclusion_model.dart';
import 'package:auto_food/features/food_order/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart' show Either;

class GetConclusionUseCase implements UseCase<ConclusionModel, NoParams> {
  final Repository repository;

  const GetConclusionUseCase({required this.repository});

  Future<Either<Failure, ConclusionModel>> call(NoParams params) async =>
      await repository.getConclusion();
}
