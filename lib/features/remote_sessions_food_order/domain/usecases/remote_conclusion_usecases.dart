import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_conclusion_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/domain/repositories/remote_repository.dart';
import 'package:dartz/dartz.dart' show Either;

class RemoteGetConclusion implements UseCase<RemoteConclusionModel, String> {
  final RemoteRepository repository;
  const RemoteGetConclusion({required this.repository});
  Future<Either<Failure, RemoteConclusionModel>> call(String params) async =>
      await repository.getConclusion(params);
}
