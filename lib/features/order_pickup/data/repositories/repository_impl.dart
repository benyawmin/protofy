import 'package:Goodbytz/core/error/exceptions.dart';
import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/core/network/network_info.dart';
import 'package:Goodbytz/features/order_pickup/data/datasources/local_data_source.dart';
import 'package:Goodbytz/features/order_pickup/data/datasources/remote_data_source.dart';
import 'package:Goodbytz/features/order_pickup/data/models/order_data_model.dart';
import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/domain/repositories/order_repository.dart';
import 'package:dartz/dartz.dart';

typedef Future<OrderDataModel> _TokenPicker();

class RepositoryImpl implements OrderRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, OrderData>> checkOrderID(
      {required String orderId}) async {
    return await _getToken(() {
      return remoteDataSource.getOrderData(orderId);
    });
  }

  Future<Either<Failure, OrderData>> _getToken(
    _TokenPicker tokenPicker,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteOrderData = await tokenPicker();
        final dishes = remoteOrderData.dishes;

        localDataSource.cacheOrderData(
            OrderDataModel(orderId: remoteOrderData.orderId, dishes: dishes));
        return Right(
            OrderData(orderId: remoteOrderData.orderId, dishes: dishes));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnection());
    }
  }
}
