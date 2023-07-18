import 'package:clean_architecture_tdd_course/core/network/network_info.dart';
import 'package:clean_architecture_tdd_course/core/util/input_converter.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/datasources/local_data_source.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/datasources/remote_data_source.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/repositories/repository_impl.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/usecases/get_auth_data.dart';
import 'package:clean_architecture_tdd_course/features/card_management/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Card Management
  sl.registerFactory(() => LoginBloc(
      getAuthToken: sl(),
      inputEmailValidation: sl(),
      inputPasswordValidation: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetAuthData(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => RepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(secureStorage: sl()));
  //! Core
  sl.registerLazySingleton(() => InputEmailValidation());
  sl.registerLazySingleton(() => InputPasswordValidation());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => secureStorage);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
