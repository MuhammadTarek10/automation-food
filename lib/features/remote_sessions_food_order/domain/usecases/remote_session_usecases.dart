import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/requests/requests.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_session_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/domain/repositories/remote_repository.dart';
import 'package:dartz/dartz.dart' show Either;

class GetSessionsUeeCase
    implements UseCase<List<RemoteSessionModel>, NoParams> {
  final RemoteRepository repository;
  const GetSessionsUeeCase({required this.repository});
  Future<Either<Failure, List<RemoteSessionModel>>> call(
          NoParams params) async =>
      await repository.getSessions();
}

class CreateSessionUeeCase
    implements UseCase<RemoteSessionModel, RemoteSessionRequest> {
  final RemoteRepository repository;
  const CreateSessionUeeCase({required this.repository});
  Future<Either<Failure, RemoteSessionModel>> call(
          RemoteSessionRequest params) async =>
      await repository.createSession(params);
}

class SearchSessionUeeCase
    implements UseCase<RemoteSessionModel, RemoteSessionRequest> {
  final RemoteRepository repository;
  const SearchSessionUeeCase({required this.repository});
  Future<Either<Failure, RemoteSessionModel>> call(
          RemoteSessionRequest params) async =>
      await repository.searchSession(params);
}

class DeleteSessionUeeCase
    implements UseCase<RemoteSessionModel, RemoteSessionRequest> {
  final RemoteRepository repository;
  const DeleteSessionUeeCase({required this.repository});
  Future<Either<Failure, RemoteSessionModel>> call(
          RemoteSessionDeleteRequest params) async =>
      await repository.deleteSession(params);
}
