import 'dart:developer';

import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/food_order/data/datasources/data_source.dart';
import 'package:auto_food/features/food_order/data/models/conclusion_model.dart';
import 'package:auto_food/features/food_order/data/models/order_model.dart';
import 'package:sqflite/sqlite_api.dart';

class LocalDataSource implements DataSource {
  final Database database;

  const LocalDataSource({required this.database});

  @override
  Future<List<OrderModel>> getOrders() async {
    final orders = await database.query(
      AppStrings.databaseTableName,
      columns: [
        AppStrings.databaseColId,
        AppStrings.databaseColName,
        AppStrings.databaseColOrder,
        AppStrings.databaseColPrice,
        AppStrings.databaseColPrice,
        AppStrings.databaseColPayed,
        AppStrings.databaseColRemaining,
        AppStrings.databaseColDone
      ],
    );
    return OrderModel.fromJsonList(orders);
  }

  @override
  Future<void> saveOrder(OrderModel order) async {
    await database.insert(
      AppStrings.databaseTableName,
      order.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteOrder(OrderModel order) {
    return database.delete(
      AppStrings.databaseTableName,
      where: '${AppStrings.databaseColId} = ?',
      whereArgs: [order.id],
    );
  }

  @override
  Future<void> updateOrder(OrderModel order) {
    return database.update(
      AppStrings.databaseTableName,
      order.toJson(),
      where: '${AppStrings.databaseColId} = ?',
      whereArgs: [order.id],
    );
  }

  @override
  Future<void> deleteAllOrders() {
    return database.delete(
      AppStrings.databaseTableName,
    );
  }

  @override
  Future<ConclusionModel> getConclusion() async {
    final orders = await getOrders();
    double totalPrice = 0;
    double totalPayed = 0;
    double totalRemaining = 0;
    Map<String, int> totalByFood = {};
    Map<String, List<String>> orderToNames = {};
    Map<String, Map<int, List<String>>> totalByFoodCount = {};
    for (final order in orders) {
      totalPrice += order.price;
      totalPayed += order.payed;
      totalRemaining += order.remaining;
      totalByFood[order.order] = totalByFood.containsKey(order.order)
          ? totalByFood[order.order]! + 1
          : 1;
      orderToNames[order.order] = orderToNames.containsKey(order.order)
          ? orderToNames[order.order]! + [order.name]
          : [order.name];
    }
    for (final food in totalByFood.keys) {
      totalByFoodCount[food] = {
        totalByFood[food]!: orderToNames[food]!,
      };
    }
    return ConclusionModel(
      total: totalPrice,
      payed: totalPayed,
      remaining: totalRemaining,
      orderCount: totalByFoodCount,
    );
  }

  @override
  Future<void> updateOrderDone(OrderModel orderModel) {
    return database.update(
      AppStrings.databaseTableName,
      orderModel.toJson(),
      where: '${AppStrings.databaseColId} = ?',
      whereArgs: [orderModel.id],
    );
  }
}
