import 'dart:convert';

import 'package:Goodbytz/core/error/exceptions.dart';
import 'package:Goodbytz/features/order_pickup/data/datasources/local_data_source.dart';
import 'package:Goodbytz/features/order_pickup/data/models/order_data_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'local_data_source_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  late LocalDataSourceImpl localDataSource;
  late MockFlutterSecureStorage mockSecureStorage;

  setUp(() {
    mockSecureStorage = MockFlutterSecureStorage();
    localDataSource = LocalDataSourceImpl(secureStorage: mockSecureStorage);
  });

  group('getCachedOrderData', () {
    test('should return cached order data if it exists', () async {
      // arrange
      final tokenJson = json.encode({
        "order_id": "id",
        "dishes": [0, 2, 6]
      });
      final expectedData = OrderDataModel(orderId: 'id', dishes: const [0, 2, 6]);

      when(mockSecureStorage.read(key: anyNamed('key')))
          .thenAnswer((_) => Future.value(tokenJson));

      // act
      final result = await localDataSource.getCachedOrderData();

      // assert
      verify(mockSecureStorage.read(key: CACHED_ORDER_DATA));
      expect(result, equals(expectedData));
    });

    test('should throw CacheException when no cached order data exists', () {
      // arrange
      when(mockSecureStorage.read(key: anyNamed('key')))
          .thenAnswer((_) => Future.value(null));
      // assert
      expect(() => localDataSource.getCachedOrderData(),
          throwsA(isA<CacheException>()));
    });
  });

  group('cacheOrderData', () {
    test('should cache the orderData', () async {
      // arrange
      final tokenToCache =
          OrderDataModel(orderId: 'id', dishes: const [0, 2, 6]);
      // act
      await localDataSource.cacheOrderData(tokenToCache);
      // assert
      verify(mockSecureStorage.write(
        key: CACHED_ORDER_DATA,
        value: json.encode(tokenToCache.toJson()),
      ));
    });
  });
}
