import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/features/food_order/data/models/local_conclusion_model.dart';
import 'package:auto_food/features/food_order/domain/repositories/local_repository.dart';
import 'package:dartz/dartz.dart' show Either;

class GetConclusionUseCase implements UseCase<LocalConclusionModel, NoParams> {
  final LocalRepository repository;

  const GetConclusionUseCase({required this.repository});

  Future<Either<Failure, LocalConclusionModel>> call(NoParams params) async =>
      await repository.getConclusion();
}
