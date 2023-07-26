import 'package:Goodbytz/core/error/exceptions.dart';
import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/core/network/network_info.dart';
import 'package:Goodbytz/features/order_pickup/data/datasources/local_data_source.dart';
import 'package:Goodbytz/features/order_pickup/data/datasources/remote_data_source.dart';
import 'package:Goodbytz/features/order_pickup/data/models/order_data_model.dart';
import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/domain/repositories/order_repository.dart';
import 'package:dartz/dartz.dart';

typedef _TokenPicker = Future<OrderDataModel> Function();

class RepositoryImpl implements OrderRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  // Returns Either a Failure or the OrderData
  @override
  Future<Either<Failure, OrderData>> checkOrderID(
      {required String orderId}) async {
    return await _getDataOfOrder(() {
      return remoteDataSource.getOrderData(orderId);
    });
  }

  // Try to get the data of the order
  Future<Either<Failure, OrderData>> _getDataOfOrder(
    _TokenPicker tokenPicker,
  ) async {
    // Check if network is connected send the request
    if (await networkInfo.isConnected) {
      try {
        final remoteOrderData = await tokenPicker();
        final dishes = remoteOrderData.dishes;

        /// Caching the [OrderDataModel]
        localDataSource.cacheOrderData(
            OrderDataModel(orderId: remoteOrderData.orderId, dishes: dishes));
        return Right(
            OrderData(orderID: remoteOrderData.orderId, dishes: dishes));
      } on ServerException {
        return Left(ServerFailure());
      }
      // Send No internet connection failure if there is no internet
    } else {
      return Left(NoInternetConnection());
    }
  }
}
