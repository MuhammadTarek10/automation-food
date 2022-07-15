import 'package:auto_food/core/error/exceptions.dart';
import 'package:auto_food/core/storage/app_pref.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/network/network_info.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/responses/extensions.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/datasources/remote_data_source.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_conclusion_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_order_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_session_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/remote_login_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/apis/requests/requests.dart';
import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/features/remote_sessions_food_order/data/models/user_model.dart';
import 'package:auto_food/features/remote_sessions_food_order/domain/repositories/remote_repository.dart';
import 'package:dartz/dartz.dart';

class RemoteRespositoryImpl implements RemoteRespository {
  final AppPreference appPreference;
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  const RemoteRespositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.appPreference,
  });

  @override
  Future<Either<Failure, RemoteLoginModel>> login(
      LoginRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.login(loginRequest);
        appPreference.setToken(response.token);
        return Right(response.toModel());
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      } on UnknownException {
        return Left(UnknownFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
      RegisterRequest registerRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.register(registerRequest);
        return Right(response.toModel());
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      } on UnknownException {
        return Left(UnknownFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<RemoteSessionModel>>> getSession(
      String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getSession(id);
        return Right(response.map((resposne) => resposne.toModel()).toList());
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      } on UnknownException {
        return Left(UnknownFailure());
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
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, RemoteSessionModel>> deleteSession(
      RemoteSessionRequest remoteSessionRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.deleteSession(remoteSessionRequest);
        return Right(response.toModel());
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      } on UnknownException {
        return Left(UnknownFailure());
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
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      } on UnknownException {
        return Left(UnknownFailure());
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
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      } on UnknownException {
        return Left(UnknownFailure());
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
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      } on UnknownException {
        return Left(UnknownFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<RemoteOrderModel>>> getOrders(
      String sessionId) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getOrders(sessionId);
        return Right(response.map((resposne) => resposne.toModel()).toList());
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      } on UnknownException {
        return Left(UnknownFailure());
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
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      } on UnknownException {
        return Left(UnknownFailure());
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
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      } on UnknownException {
        return Left(UnknownFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
