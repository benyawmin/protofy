import 'package:Goodbytz/core/util/input_converter.dart';
import 'package:Goodbytz/features/order_pickup/presentation/bloc/order_input_bloc/order_input_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'core/network/network_info.dart';
import 'features/order_pickup/data/datasources/local_data_source.dart';
import 'features/order_pickup/data/datasources/remote_data_source.dart';
import 'features/order_pickup/data/repositories/repository_impl.dart';
import 'features/order_pickup/domain/repositories/order_repository.dart';
import 'features/order_pickup/domain/usecases/get_order_data.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Goodbytz
  sl.registerFactory(
      () => OrderInputBloc(getOrderData: sl(), inputOderIdValidation: sl()));

  //* Use cases
  sl.registerLazySingleton(() => GetOrderData(sl()));

  //* Repository
  sl.registerLazySingleton<OrderRepository>(() => RepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //* Data sources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(secureStorage: sl()));
  //! Core
  sl.registerLazySingleton(() => InputOrderIDValidation());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  const secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => secureStorage);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnection());
}
