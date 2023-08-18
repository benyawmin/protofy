import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:protofy/features/order_pickup/presentation/bloc/order_input_bloc/salad_list_bloc.dart';

import 'core/network/network_info.dart';
import 'features/order_pickup/data/datasources/remote_data_source.dart';
import 'features/order_pickup/data/repositories/repository_impl.dart';
import 'features/order_pickup/domain/repositories/salad_repository.dart';
import 'features/order_pickup/domain/usecases/get_salad_list_data.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Protofy
  sl.registerFactory(() => SaladListBloc(getSaladListData: sl()));

  //* Use cases
  sl.registerLazySingleton(() => GetSaladListData(sl()));

  //* Repository
  sl.registerLazySingleton<SaladRepository>(() => RepositoryImpl(
      remoteDataSource: sl(),
      //  localDataSource: sl(),
      networkInfo: sl()));

  //* Data sources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  const secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => secureStorage);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnection());
}
