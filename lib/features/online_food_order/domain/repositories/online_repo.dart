import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/features/online_food_order/domain/entities/order_in_room.dart';
import 'package:auto_food/features/online_food_order/domain/entities/room.dart';
import 'package:auto_food/features/online_food_order/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class OnlineRepoistory {
  // todo: make return user
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> register(
    String name,
    String email,
    String password,
  );

  Future<Either<Failure, List<OnlineRoom>>> getRooms();
  Future<Either<Failure, List<OrderInRoom>>> getOrders();
  Future<Either<Failure, void>> createRoom(
      String name, String code, int? number);
  Future<Either<Failure, void>> addOrder(String name, double price);
  Future<Either<Failure, void>> deleteOrder(String id);
  Future<Either<Failure, OnlineRoom>> getRoom(String id);
}
