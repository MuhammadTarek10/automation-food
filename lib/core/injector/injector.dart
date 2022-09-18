import 'package:auto_food/core/storage/app_pref.dart';
import 'package:auto_food/core/usecases/usecases.dart';
import 'package:auto_food/core/utils/app_strings.dart';
import 'package:auto_food/features/food_order/data/datasources/local_data_source.dart';
import 'package:auto_food/features/food_order/data/repositories/local_repository_impl.dart';
import 'package:auto_food/features/food_order/domain/repositories/local_repository.dart';
import 'package:auto_food/features/food_order/domain/usecases/conclusion_usecase.dart';
import 'package:auto_food/features/food_order/domain/usecases/order_usecase.dart';
import 'package:auto_food/features/food_order/presentation/bloc/food_order_bloc.dart';
import 'package:auto_food/features/online_food_order/data/apis/network/app_service_client.dart';
import 'package:auto_food/features/online_food_order/data/apis/network/dio_factory.dart';
import 'package:auto_food/features/online_food_order/data/apis/network/network_info.dart';
import 'package:auto_food/features/online_food_order/data/datasources/remote_data_source.dart';
import 'package:auto_food/features/online_food_order/data/repositories/online_repo_impl.dart';
import 'package:auto_food/features/online_food_order/domain/usecases/usecases.dart';
import 'package:auto_food/features/online_food_order/presentation/bloc/online_food_order_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  instance.registerLazySingleton<LocalRepository>(
      () => LocalRepositoryImpl(localDataSource: instance()));
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(InternetConnectionChecker()));
  final shared = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => shared);
  instance.registerLazySingleton<AppPreference>(
      () => AppPreference(sharedPreferences: instance()));
  instance.registerLazySingleton<DioFactory>(
      () => DioFactory(appPreference: instance()));
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
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
    "${AppStrings.databaseColRemaining}" DOUBLE NOT NULL,
    "${AppStrings.databaseColDone}" BOOL NOT NULL
  )
  ''',
  );
}

initLocal() {
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
    instance.registerFactory<GetConclusionByOrderUseCase>(
        () => GetConclusionByOrderUseCase(repository: instance()));
  }
  if (!GetIt.I.isRegistered<UseCase>()) {
    instance.registerFactory<UpdateOrderDoneUseCase>(
        () => UpdateOrderDoneUseCase(repository: instance()));
  }

  if (!GetIt.I.isRegistered<UseCase>()) {
    instance.registerFactory<GetConclusionByUserUseCase>(
        () => GetConclusionByUserUseCase(repository: instance()));
  }

  instance.registerFactory(
    () => FoodOrderBloc(
      saveOrderUseCase: instance<SaveOrderUseCase>(),
      deleteOrderUseCase: instance<DeleteOrderUseCase>(),
      getOrdersUseCase: instance<GetOrdersUseCase>(),
      updateOrderUseCase: instance<UpdateOrderUseCase>(),
      deleteAllOrdersUseCase: instance<DeleteAllOrdersUseCase>(),
      getConclusionUseCase: instance<GetConclusionByOrderUseCase>(),
      updateOrderDoneUseCase: instance<UpdateOrderDoneUseCase>(),
      getConclusionByUserUseCase: instance<GetConclusionByUserUseCase>(),
    ),
  );
}

initRemote() {
  // data source
  if (!GetIt.I.isRegistered<RemoteDataSource>()) {
    instance.registerFactory<RemoteDataSource>(
        () => RemoteDataSource(appServiceClient: instance<AppServiceClient>()));
  }
  // repository
  if (!GetIt.I.isRegistered<OnlineRepositoryImpl>()) {
    instance.registerFactory<OnlineRepositoryImpl>(
      () => OnlineRepositoryImpl(
        dataSource: instance<RemoteDataSource>(),
        networkInfo: instance<NetworkInfo>(),
      ),
    );
  }

  // usecases
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(repository: instance<OnlineRepositoryImpl>()));
  }
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(
        () => RegisterUseCase(repository: instance<OnlineRepositoryImpl>()));
  }
  // bloc

  if (!GetIt.I.isRegistered<OnlineFoodOrderBloc>()) {
    instance.registerFactory<OnlineFoodOrderBloc>(
      () => OnlineFoodOrderBloc(
        loginUseCase: instance<LoginUseCase>(),
        registerUseCase: instance<RegisterUseCase>(),
      ),
    );
  }
}
