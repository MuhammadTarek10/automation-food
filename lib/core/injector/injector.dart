import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/food_order/data/datasources/local_data_source.dart';
import 'package:auto_food/features/food_order/data/repositories/repository_impl.dart';
import 'package:auto_food/features/food_order/domain/repositories/repository.dart';
import 'package:auto_food/features/food_order/domain/usecases/conclusion_usecase.dart';
import 'package:auto_food/features/food_order/domain/usecases/order_usecase.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

final instance = GetIt.instance;

Future<void> initApp() async {
  Database database = await openDatabase(
    '${await getDatabasesPath()}/${AppStrings.databaseName}',
    onCreate: _createDatabase,
    version: AppStrings.databaseVersion,
  );

  instance.registerLazySingleton<Database>(() => database);
  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSource(database: instance<Database>()));
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(localDataSource: instance()));
}

Future<dynamic> _createDatabase(Database db, int version) async {
  await db.execute(
    '''
  CREATE TABLE IF NOT EXISTS "${AppStrings.databaseTableName}" (
    "${AppStrings.databaseColId}" TEXT PRIMARY KEY,
    "${AppStrings.databaseColName}" TEXT NOT NULL,
    "${AppStrings.databaseColOrder}" TEXT NOT NULL,
    "${AppStrings.databaseColPrice}" DOUBLE NOT NULL,
    "${AppStrings.databaseColPayed}" DOUBLE NOT NULL,
    "${AppStrings.databaseColRemaining}" DOUBLE NOT NULL
  )
  ''',
  );
}

initOrder() {
  if (!GetIt.I.isRegistered<UseCase>()) {
    instance.registerFactory<SaveOrderUseCase>(
        () => SaveOrderUseCase(repository: instance()));
  }
  if (!GetIt.I.isRegistered<UseCase>()) {
    instance.registerFactory<DeleteOrderUseCase>(
        () => DeleteOrderUseCase(repository: instance()));
  }
  if (!GetIt.I.isRegistered<UseCase>()) {
    instance.registerFactory<GetOrdersUseCase>(
        () => GetOrdersUseCase(repository: instance()));
  }
  if (!GetIt.I.isRegistered<UseCase>()) {
    instance.registerFactory<UpdateOrderUseCase>(
        () => UpdateOrderUseCase(repository: instance()));
  }
  if (!GetIt.I.isRegistered<UseCase>()) {
    instance.registerFactory<DeleteAllOrdersUseCase>(
        () => DeleteAllOrdersUseCase(repository: instance()));
  }
  if (!GetIt.I.isRegistered<UseCase>()) {
    instance.registerFactory<GetConclusionUseCase>(
        () => GetConclusionUseCase(repository: instance()));
  }
  instance.registerFactory(
    () => FoodOrderBloc(
      saveOrderUseCase: instance<SaveOrderUseCase>(),
      deleteOrderUseCase: instance<DeleteOrderUseCase>(),
      getOrdersUseCase: instance<GetOrdersUseCase>(),
      updateOrderUseCase: instance<UpdateOrderUseCase>(),
      deleteAllOrdersUseCase: instance<DeleteAllOrdersUseCase>(),
      getConclusionUseCase: instance<GetConclusionUseCase>(),
    ),
  );
}
