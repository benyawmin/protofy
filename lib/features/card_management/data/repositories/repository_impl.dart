import 'package:Goodbytz/core/error/exceptions.dart';
import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/core/network/network_info.dart';
import 'package:Goodbytz/features/card_management/data/datasources/local_data_source.dart';
import 'package:Goodbytz/features/card_management/data/datasources/remote_data_source.dart';
import 'package:Goodbytz/features/card_management/data/models/order_data_model.dart';
import 'package:Goodbytz/features/card_management/domain/entities/order_data.dart';
import 'package:Goodbytz/features/card_management/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

typedef Future<OrderDataModel> _TokenPicker();

class RepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, OrderData>> authentication(
      {required String orderId}) async {
    return await _getToken(() {
      return remoteDataSource.getAuthToken(orderId);
    });
  }

  Future<Either<Failure, OrderData>> _getToken(
    _TokenPicker tokenPicker,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteOrderData = await tokenPicker();
        final dishes = remoteOrderData.dishes
            .map((dish) => DishModel(boxNumber: dish.boxNumber))
            .toList();
        localDataSource.cacheCards(
            OrderDataModel(orderId: remoteOrderData.orderId, dishes: dishes));
        return Right(OrderData(orderId: remoteOrderData.orderId, dishes: dishes));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnection());
    }
  }
}
