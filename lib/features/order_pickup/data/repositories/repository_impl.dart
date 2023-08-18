import 'package:protofy/core/error/exceptions.dart';
import 'package:protofy/core/error/failures.dart';
import 'package:protofy/core/network/network_info.dart';
import 'package:protofy/core/usecases/usecase.dart';
import 'package:protofy/features/order_pickup/data/datasources/remote_data_source.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';
import 'package:protofy/features/order_pickup/domain/repositories/salad_repository.dart';
import 'package:dartz/dartz.dart';

typedef _TokenPicker = Future<StadtSalatModel> Function();

class RepositoryImpl implements SaladRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  // Returns Either a Failure or the salad data list
  @override
  Future<Either<Failure, StadtSalatModel>> getSaladListOfData() async {
    return await _getDataOfSaladList(() {
      return remoteDataSource.getSaladData();
    }, NoParams());
  }

  // Try to get the data of the order
  Future<Either<Failure, StadtSalatModel>> _getDataOfSaladList(
      _TokenPicker tokenPicker, async) async {
    // Check if network is connected send the request
    if (await networkInfo.isConnected) {
      try {
        final remoteOrderData = await tokenPicker();
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
