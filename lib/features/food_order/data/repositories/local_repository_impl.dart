// ignore_for_file: void_checks

import 'dart:developer';
import 'dart:ffi';

import 'package:auto_food/core/error/exceptions.dart';
import 'package:auto_food/features/food_order/data/datasources/local_data_source.dart';
import 'package:auto_food/features/food_order/data/models/local_conclusion_model.dart';
import 'package:auto_food/features/food_order/data/models/local_order_model.dart';
import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/features/food_order/domain/repositories/local_repository.dart';
import 'package:dartz/dartz.dart' show Either, Right, Left;

class LocalRepositoryImpl implements LocalRepository {
  final LocalDataSource localDataSource;

  const LocalRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>> deleteOrder(LocalOrderModel order) async {
    try {
      await localDataSource.deleteOrder(order);
      return const Right(Void);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, LocalConclusionOrderModel>>
      getConclusionByOrder() async {
    try {
      final conclusion = await localDataSource.getConclusionByOrder();
      return Right(conclusion);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<LocalOrderModel>>> getOrders() async {
    try {
      final orders = await localDataSource.getOrders();
      return Right(orders);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveOrder(LocalOrderModel order) async {
    try {
      await localDataSource.saveOrder(order);
      return const Right(Void);
    } catch (e) {
      log(e.toString());
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteAllOrders() async {
    try {
      await localDataSource.deleteAllOrders();
      return const Right(Void);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateOrder(LocalOrderModel order) async {
    try {
      await localDataSource.updateOrder(order);
      return const Right(Void);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateOrderDone(
      LocalOrderModel orderModel) async {
    try {
      await localDataSource.updateOrderDone(orderModel);
      return const Right(Void);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, LocalConclusionUserModel>>
      getConclusionByUser() async {
    try {
      final conclusion = await localDataSource.getConclusionByUser();
      return Right(conclusion);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
