import 'package:Goodbytz/core/error/exceptions.dart';
import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/core/network/network_info.dart';
import 'package:Goodbytz/features/order_pickup/data/datasources/local_data_source.dart';
import 'package:Goodbytz/features/order_pickup/data/datasources/remote_data_source.dart';
import 'package:Goodbytz/features/order_pickup/data/models/order_data_model.dart';
import 'package:Goodbytz/features/order_pickup/data/repositories/repository_impl.dart';
import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/domain/repositories/order_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import 'repository_impl_test.mocks.dart';

@GenerateMocks([RemoteDataSource, LocalDataSource, NetworkInfo])
void main() {
  late OrderRepository repository;
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
    const orderID = 'benyamin_jafari_2000';
    final dishes = [0, 2, 6];

    test('should return OrderData when the device is connected to the network',
        () async {
      // arrange
      final expectedUserAuth = OrderData(orderID: orderID, dishes: dishes);
      final remoteToken = OrderDataModel(orderId: orderID, dishes: dishes);
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getOrderData(orderID))
          .thenAnswer((_) async => remoteToken);
      when(mockLocalDataSource.cacheOrderData(remoteToken))
          .thenAnswer((_) async {});

      // act
      final result = await repository.checkOrderID(
        orderId: 'benyamin_jafari_2000',
      );

      // assert
      expect(result, Right(expectedUserAuth));
      verify(mockRemoteDataSource.getOrderData(orderID)).called(1);
      verify(mockLocalDataSource.cacheOrderData(remoteToken)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test(
        'should return a ServerFailure when an exception is thrown during remote call',
        () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getOrderData(orderID))
          .thenThrow(ServerException());

      // act
      final result = await repository.checkOrderID(orderId: orderID);

      // assert
      expect(result, equals(Left(ServerFailure())));
      verify(mockRemoteDataSource.getOrderData(orderID)).called(1);
      verifyZeroInteractions(mockLocalDataSource);
    });

    test(
        'should return a NoInternetConnection failure when the device is not connected to the network',
        () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      // Act
      final result = await repository.checkOrderID(orderId: orderID);

      // Assert
      expect(result, equals(Left(NoInternetConnection())));
      verifyZeroInteractions(mockRemoteDataSource);
      verifyZeroInteractions(mockLocalDataSource);
    });
  });
}
