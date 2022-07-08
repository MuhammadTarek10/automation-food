// ignore_for_file: void_checks

import 'dart:developer';
import 'dart:ffi';

import 'package:auto_food/core/error/exceptions.dart';
import 'package:auto_food/features/food_order/data/datasources/local_data_source.dart';
import 'package:auto_food/features/food_order/data/models/conclusion_model.dart';
import 'package:auto_food/features/food_order/data/models/order_model.dart';
import 'package:auto_food/core/error/failures.dart';
import 'package:auto_food/features/food_order/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart' show Either, Right, Left;

class RepositoryImpl implements Repository {
  final LocalDataSource localDataSource;

  const RepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>> deleteOrder(OrderModel order) async {
    try {
      await localDataSource.deleteOrder(order);
      return const Right(Void);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, ConclusionModel>> getConclusion() {
    // TODO: implement getConclusion
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders() async {
    try {
      final orders = await localDataSource.getOrders();
      return Right(orders);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveOrder(OrderModel order) async {
    try {
      await localDataSource.saveOrder(order);
      return const Right(Void);
    } catch (e) {
      log(e.toString());
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteAllOrders() async{
    try{
      await localDataSource.deleteAllOrders();
      return const Right(Void);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateOrder(OrderModel order) async {
    try {
      await localDataSource.updateOrder(order);
      return const Right(Void);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
