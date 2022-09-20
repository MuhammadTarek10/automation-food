import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/features/online_food_order/domain/entities/order_in_room.dart';
import 'package:auto_food/features/online_food_order/domain/entities/room.dart';
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

class GetRoomsUseCase implements UseCase<List<OnlineRoom>, NoParams> {
  final OnlineRepoistory repository;
  GetRoomsUseCase({required this.repository});

  Future<Either<Failure, List<OnlineRoom>>> call(NoParams params) async {
    return await repository.getRooms();
  }
}


class GetOrdersInRoomUseCase implements UseCase<List<OrderInRoom>, String> {
  final OnlineRepoistory repository;
  GetOrdersInRoomUseCase({required this.repository});

  Future<Either<Failure, List<OrderInRoom>>> call(NoParams params) async {
    return await repository.getOrders();
  }
}