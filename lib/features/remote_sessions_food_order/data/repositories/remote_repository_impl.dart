import 'dart:developer';

import 'package:auto_food/core/error/error_handler.dart';
import 'package:auto_food/core/storage/app_pref.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/network/network_info.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/responses/extensions.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/datasources/remote_data_source.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_conclusion_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_order_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_session_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/requests/requests.dart';
import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/user_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/domain/repositories/remote_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RemoteRespositoryImpl implements RemoteRepository {
  final AppPreference appPreference;
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  const RemoteRespositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.appPreference,
  });

  @override
  Future<Either<Failure, String>> login(LoginRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.login(loginRequest);
        await appPreference.setToken(response.token);
        appPreference.setUser(loginRequest.email, loginRequest.password);
        return Right(response.token);
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, RemoteUserModel>> register(
      RegisterRequest registerRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.register(registerRequest);
        return Right(response.toModel());
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<RemoteSessionModel>>> getSessions() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getSessions();
        return Right(response.map((resposne) => resposne.toModel()).toList());
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, RemoteSessionModel>> searchSession(
      RemoteSessionRequest remoteSessionRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.searchSession(remoteSessionRequest);
        return Right(response.toModel());
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, RemoteSessionModel>> deleteSession(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.deleteSession(id);
        return Right(response.toModel());
      } on DioError catch (error) {
        log(error.toString());
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, RemoteSessionModel>> createSession(
      RemoteSessionRequest remoteSessionRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.createSession(remoteSessionRequest);
        return Right(response.toModel());
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, RemoteOrderModel>> deleteOrder(
      RemoteOrderRequest remoteOrderRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.deleteOrder(remoteOrderRequest);
        return Right(response.toModel());
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, RemoteOrderModel>> editOrder(
      RemoteOrderRequest remoteOrderRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.editOrder(remoteOrderRequest);
        return Right(response.toModel());
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<RemoteGetOrderInSessionModel>>> getOrders(
      String sessionId) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getOrders(sessionId);
        return Right(response.toModel());
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, RemoteOrderModel>> addOrder(
      RemoteOrderRequest remoteOrderRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.addOrder(remoteOrderRequest);
        return Right(response.toModel());
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, RemoteConclusionModel>> getConclusion(
      String sessionId) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getConclusion(sessionId);
        return Right(response.toModel());
      } on DioError catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
