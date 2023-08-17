import 'package:protofy/core/error/exceptions.dart';
import 'package:protofy/core/error/failures.dart';
import 'package:protofy/core/network/network_info.dart';
import 'package:protofy/core/usecases/usecase.dart';
import 'package:protofy/features/order_pickup/data/datasources/local_data_source.dart';
import 'package:protofy/features/order_pickup/data/datasources/remote_data_source.dart';
import 'package:protofy/features/order_pickup/data/models/order_data_model.dart';
import 'package:protofy/features/order_pickup/domain/repositories/order_repository.dart';
import 'package:dartz/dartz.dart';

typedef _TokenPicker = Future<List> Function();

class RepositoryImpl implements OrderRepository {
  final RemoteDataSource remoteDataSource;
  // final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    required this.remoteDataSource,
    // required this.localDataSource,
    required this.networkInfo,
  });

  // Returns Either a Failure or the OrderData
  @override
  Future<Either<Failure, List>> checkOrderID() async {
    return await _getDataOfOrder(() {
      return remoteDataSource.getOrderData();
    }, NoParams());
  }

  // Try to get the data of the order
  Future<Either<Failure, List>> _getDataOfOrder(
      _TokenPicker tokenPicker, async) async {
    // Check if network is connected send the request
    if (await networkInfo.isConnected) {
      try {
        final remoteOrderData = await tokenPicker();

        /// Caching the [OrderDataModel]
        // localDataSource.cacheOrderData(
        //     StadtSalatModel(products: remoteOrderData.products));
        return Right(remoteOrderData);
      } on ServerException {
        return Left(ServerFailure());
      }
      // Send No internet connection failure if there is no internet
    } else {
      return Left(NoInternetConnection());
    }
  }
}
