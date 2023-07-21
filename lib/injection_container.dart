import 'package:Goodbytz/core/util/input_converter.dart';
import 'package:Goodbytz/features/card_management/presentation/bloc/order_pickup_bloc/order_pickup_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'core/network/network_info.dart';
import 'features/card_management/data/datasources/local_data_source.dart';
import 'features/card_management/data/datasources/remote_data_source.dart';
import 'features/card_management/data/repositories/repository_impl.dart';
import 'features/card_management/domain/repositories/auth_repository.dart';
import 'features/card_management/domain/usecases/get_auth_data.dart';
import 'features/card_management/presentation/bloc/login_bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Goodbytz
  sl.registerFactory(
      () => LoginBloc(getOrderData: sl(), inputOderIdValidation: sl()));
  sl.registerFactory(() => OrderPickupBloc());

  //* Use cases
  sl.registerLazySingleton(() => GetOrderData(sl()));

  //* Repository
  sl.registerLazySingleton<AuthRepository>(() => RepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //* Data sources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(secureStorage: sl()));
  //! Core
  sl.registerLazySingleton(() => InputEmailValidation());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => secureStorage);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnection());
}
