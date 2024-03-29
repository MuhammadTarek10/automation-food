import 'dart:developer';

import 'package:auto_food/core/error/error_handler.dart';
import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/core/storage/app_pref.dart';
import 'package:auto_food/features/online_food_order/data/apis/network/network_info.dart';
import 'package:auto_food/features/online_food_order/data/apis/requrests/requests.dart';
import 'package:auto_food/features/online_food_order/data/apis/responses/mapper.dart';
import 'package:auto_food/features/online_food_order/data/datasources/online_data_source.dart';
import 'package:auto_food/features/online_food_order/domain/entities/conclusion.dart';
import 'package:auto_food/features/online_food_order/domain/entities/order.dart';
import 'package:auto_food/features/online_food_order/domain/entities/order_in_room.dart';
import 'package:auto_food/features/online_food_order/domain/entities/room.dart';
import 'package:auto_food/features/online_food_order/domain/entities/user.dart';
import 'package:auto_food/features/online_food_order/domain/repositories/online_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class OnlineRepositoryImpl implements OnlineRepoistory {
  final OnlineDataSource dataSource;
  final NetworkInfo networkInfo;
  final AppPreference appPreference = instance<AppPreference>();

  OnlineRepositoryImpl({
    required this.dataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final request = LoginRequest(email: email, password: password);
        final response = await dataSource.login(request);
        appPreference.setToken(response.token);
        appPreference.setUserId(response.user.id);
        return Right(response.toModel());
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, User>> register(
      String name, String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final request =
            RegisterRequest(name: name, email: email, password: password);
        final response = await dataSource.register(request);
        appPreference.setUserId(response.id);
        return Right(response.toModel());
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<OnlineRoom>>> getRooms() async {
    if (await networkInfo.isConnected) {
      try {
        final userId = appPreference.getUserId();
        if (userId != null) {
          final response = await dataSource.getRooms(userId);
          return Right(response.toModel());
        } else {
          return Left(UnauthorizedFailure());
        }
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderInRoom>>> getOrders() async {
    if (await networkInfo.isConnected) {
      try {
        final userId = appPreference.getUserId();
        final roomId = appPreference.getRoomId();
        if (userId != null && roomId != null) {
          final response = await dataSource.getOrders(userId, roomId);
          return Right(response.toModel());
        } else {
          return Left(UnauthorizedFailure());
        }
      } on DioError catch (error) {
        log(error.toString());
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> createRoom(
    String name,
    String code,
    int? number,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final userId = appPreference.getUserId();
        if (userId != null) {
          final request = CreateRoomRequest(
            name: name,
            code: code,
            number: number,
          );
          final response = await dataSource.createRoom(userId, request);
          return Right(response);
        } else {
          return Left(UnauthorizedFailure());
        }
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addOrder(String name, double price) async {
    if (await networkInfo.isConnected) {
      try {
        final userId = appPreference.getUserId();
        final roomId = appPreference.getRoomId();
        if (userId != null && roomId != null) {
          final request = AddOrderRequest(
            name: name,
            price: price,
            roomId: roomId,
          );
          final response = await dataSource.addOrder(userId, request);
          return Right(response);
        } else {
          return Left(UnauthorizedFailure());
        }
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteOrder(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final userId = appPreference.getUserId();
        if (userId != null) {
          final response = await dataSource.deleteOrder(id, userId);
          return Right(response);
        } else {
          return Left(UnauthorizedFailure());
        }
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, OnlineRoom>> getRoom() async {
    if (await networkInfo.isConnected) {
      try {
        final userId = appPreference.getUserId();
        final roomId = appPreference.getRoomId();
        if (userId != null && roomId != null) {
          final response = await dataSource.getRoom(roomId);
          return Right(response.toModel());
        } else {
          return Left(UnauthorizedFailure());
        }
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteRoom() async {
    if (await networkInfo.isConnected) {
      try {
        final userId = appPreference.getUserId();
        final roomId = appPreference.getRoomId();
        if (userId != null && roomId != null) {
          final response = await dataSource.deleteRoom(userId, roomId);
          return Right(response);
        } else {
          return Left(UnauthorizedFailure());
        }
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, OnlineConclusion>> getConclusion(
    List<OrderInRoom> orders,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final userId = appPreference.getUserId();
        final roomId = appPreference.getRoomId();
        if (userId != null && roomId != null) {
          final conclusion = Helper.getConlsuionByOrder(orders);
          return Right(conclusion);
        } else {
          return Left(UnauthorizedFailure());
        }
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, OnlineRoom>> joinRoom(String code) async {
    if (await networkInfo.isConnected) {
      try {
        final userId = appPreference.getUserId();
        if (userId != null) {
          final request = JoinRoomRequest(code: code);
          final resposne = await dataSource.joinRoom(userId, request);
          return Right(resposne.toModel());
        } else {
          return Left(UnauthorizedFailure());
        }
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}

class Helper {
  static OnlineConclusion getConlsuionByOrder(List<OrderInRoom> orders) {
    final data = orders;
    Map<String, int> totalByFood = {};
    Map<String, List<OnlineOrder>> orderToNames = {};
    Map<String, Map<int, List<OnlineOrder>>> totalByFoodCount = {};
    for (final element in data) {
      totalByFood[element.order.name] =
          totalByFood.containsKey(element.order.name)
              ? totalByFood[element.order.name]! + 1
              : 1;
      orderToNames[element.order.name] =
          orderToNames.containsKey(element.order.name)
              ? [...orderToNames[element.order.name]!, element.order]
              : [element.order];
    }
    for (final food in totalByFood.keys) {
      totalByFoodCount[food] = {
        totalByFood[food]!: orderToNames[food]!,
      };
    }
    final conclusion = OnlineConclusion(
      orders: totalByFoodCount,
      total: data.fold(
          0, (previousValue, element) => previousValue + element.order.price),
    );
    return conclusion;
  }
}
