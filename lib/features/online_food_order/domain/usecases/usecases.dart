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

class GetOrdersInRoomUseCase implements UseCase<List<OrderInRoom>, NoParams> {
  final OnlineRepoistory repository;
  GetOrdersInRoomUseCase({required this.repository});

  Future<Either<Failure, List<OrderInRoom>>> call(NoParams params) async {
    return await repository.getOrders();
  }
}

class CreateRoomUseCase implements UseCase<void, String> {
  final OnlineRepoistory repository;
  CreateRoomUseCase({required this.repository});

  Future<Either<Failure, void>> call(
      String name, String code, int? number) async {
    return await repository.createRoom(name, code, number);
  }
}

class AddOrderUseCase implements UseCase<void, String> {
  final OnlineRepoistory repository;
  AddOrderUseCase({required this.repository});

  Future<Either<Failure, void>> call(String name, double price) async {
    return await repository.addOrder(name, price);
  }
}

class DeleteOnlineOrderUseCase implements UseCase<void, String> {
  final OnlineRepoistory repository;
  DeleteOnlineOrderUseCase({required this.repository});

  Future<Either<Failure, void>> call(String id) async {
    return await repository.deleteOrder(id);
  }
}


class GetRoomUseCase implements UseCase<OnlineRoom, String> {
  final OnlineRepoistory repository;
  GetRoomUseCase({required this.repository});

  Future<Either<Failure, OnlineRoom>> call(String id) async {
    return await repository.getRoom(id);
  }
}