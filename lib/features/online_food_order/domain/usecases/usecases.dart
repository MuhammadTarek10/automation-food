import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/features/online_food_order/domain/entities/user.dart';
import 'package:auto_food/features/online_food_order/domain/repositories/online_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements UseCase<void, String> {
  final OnlineRepoistory repository;
  LoginUseCase({required this.repository});

  Future<Either<Failure, User>> call(String email, String password) async {
    return await repository.login(email, password);
  }
}

class RegisterUseCase implements UseCase<void, String> {
  final OnlineRepoistory repository;
  RegisterUseCase({required this.repository});

  Future<Either<Failure, void>> call(
      String name, String email, String password) async {
    return await repository.register(name, email, password);
  }
}
