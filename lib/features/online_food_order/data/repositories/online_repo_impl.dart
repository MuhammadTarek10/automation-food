import 'package:auto_food/core/error/error_handler.dart';
import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/core/injector/injector.dart';
import 'package:auto_food/core/storage/app_pref.dart';
import 'package:auto_food/features/online_food_order/data/apis/network/network_info.dart';
import 'package:auto_food/features/online_food_order/data/apis/requrests/requests.dart';
import 'package:auto_food/features/online_food_order/data/apis/responses/mapper.dart';
import 'package:auto_food/features/online_food_order/data/datasources/online_data_source.dart';
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
        final request = RegisterRequest(name: name, email: email, password: password);
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
}
