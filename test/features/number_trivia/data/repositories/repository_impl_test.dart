import 'package:clean_architecture_tdd_course/features/card_management/domain/entities/credit_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:clean_architecture_tdd_course/core/error/exceptions.dart';
import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/core/network/network_info.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/datasources/local_data_source.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/datasources/remote_data_source.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/models/user_data_model.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/entities/user_data.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/repositories/repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import 'repository_impl_test.mocks.dart';

@GenerateMocks([RemoteDataSource, LocalDataSource, NetworkInfo])
void main() {
  late AuthRepository repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = RepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('authentication', () {
    final email = 'email';
    final password = 'password';

    test('should return UserAuth when the device is connected to the network',
        () async {
      // arrange
      // TODO: remove duplcation
      final List<CreditCard> cards = [
        CreditCard(
            name: 'name',
            phoneNumber: 'phoneNumber',
            email: 'email',
            ibanNumber: 'ibanNumber')
      ];
      final List<CreditCardModel> cardsModel = [
        CreditCardModel(
            name: 'name',
            phoneNumber: 'phoneNumber',
            email: 'email',
            ibanNumber: 'ibanNumber')
      ];
      final expectedUserAuth = UserData(token: 'token', cards: cards);
      final remoteToken = UserDataModel(token: 'token', cards: cardsModel);
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getAuthToken(email, password))
          .thenAnswer((_) async => remoteToken);
      when(mockLocalDataSource.cacheCards(remoteToken))
          .thenAnswer((_) async => null);

      // act
      final result = await repository.authentication(
        email: email,
        password: password,
      );

      // assert
      expect(result, Right(expectedUserAuth));
      verify(mockRemoteDataSource.getAuthToken(email, password)).called(1);
      verify(mockLocalDataSource.cacheCards(remoteToken)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test(
        'should return a ServerFailure when an exception is thrown during remote authentication',
        () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getAuthToken(email, password))
          .thenThrow(ServerException());

      // act
      final result = await repository.authentication(
        email: email,
        password: password,
      );

      // assert
      expect(result, equals(Left(ServerFailure())));
      verify(mockRemoteDataSource.getAuthToken(email, password)).called(1);
      verifyZeroInteractions(mockLocalDataSource);
    });

    test(
        'should return a NoInternetConnection failure when the device is not connected to the network',
        () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      // Act
      final result = await repository.authentication(
        email: email,
        password: password,
      );

      // Assert
      expect(result, equals(Left(NoInternetConnection())));
      verifyZeroInteractions(mockRemoteDataSource);
      verifyZeroInteractions(mockLocalDataSource);
    });
  });
}
