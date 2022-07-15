import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/requests/requests.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_login_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/user_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/domain/repositories/remote_repository.dart';
import 'package:dartz/dartz.dart' show Either;

class RemoteLoginUseCase implements UseCase<RemoteLoginModel, LoginRequest> {
  final RemoteRepository repository;
  const RemoteLoginUseCase({required this.repository});
  Future<Either<Failure, RemoteLoginModel>> call(LoginRequest params) async =>
      await repository.login(params);
}

class RemoteRegisterUseCase
    implements UseCase<RemoteUserModel, RegisterRequest> {
  final RemoteRepository repository;
  const RemoteRegisterUseCase({required this.repository});
  Future<Either<Failure, RemoteUserModel>> call(RegisterRequest params) async =>
      await repository.register(params);
}


