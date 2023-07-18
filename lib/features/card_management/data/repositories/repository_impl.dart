import 'package:clean_architecture_tdd_course/core/error/exceptions.dart';
import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/core/network/network_info.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/datasources/local_data_source.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/datasources/remote_data_source.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/models/user_data_model.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/entities/credit_card.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/entities/user_data.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

typedef Future<UserDataModel> _TokenPicker();

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
  Future<Either<Failure, UserData>> authentication(
      {required String email, required String password}) async {
    return await _getToken(() {
      return remoteDataSource.getAuthToken(email, password);
    });
  }

  Future<Either<Failure, UserData>> _getToken(
    _TokenPicker tokenPicker,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCredentials = await tokenPicker();
        final creditCards = remoteCredentials.cards
            .map((card) => CreditCard(
                  name: card.name,
                  phoneNumber: card.phoneNumber,
                  email: card.email,
                  ibanNumber: card.ibanNumber,
                ))
            .toList();
        localDataSource.cacheCards(UserDataModel(
            token: remoteCredentials.token, cards: remoteCredentials.cards));
        return Right(
            UserData(token: remoteCredentials.token, cards: creditCards));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnection());
    }
  }
}
