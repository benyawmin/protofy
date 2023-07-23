import 'dart:convert';

import 'package:Goodbytz/features/card_management/data/datasources/local_data_source.dart';
import 'package:Goodbytz/features/card_management/data/models/order_data_model.dart';
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

  group('getCachedAuthToken', () {
    test('should return cached user data if it exists', () async {
      // arrange
      final List<OrderDataModel> orderData = [
        OrderDataModel(
          orderId: 'id',
          dishes: [0, 2, 6]
        )
      ];
      final tokenJson = json.encode({
        'token': 'id',
        'cards': dishes.map((card) => card.toJson()).toList(),
      });
      final expectedData =
          OrderDataModel(token: 'REQUESTED_TOKEN', cards: cards);

      when(mockSecureStorage.read(key: anyNamed('key')))
          .thenAnswer((_) => Future.value(tokenJson));

      // act
      final result = await localDataSource.getCredentials();

      // assert
      verify(mockSecureStorage.read(key: CACHED_USER_DATA));
      expect(result, equals(expectedData));
    });

    test('should throw CacheException when no cached auth token exists', () {
      // arrange
      when(mockSecureStorage.read(key: anyNamed('key')))
          .thenAnswer((_) => Future.value(null));
      // assert
      expect(() => localDataSource.getCredentials(),
          throwsA(isA<CacheException>()));
    });
  });

  group('cacheAuthToken', () {
    final List<CreditCardModel> cards = [
      CreditCardModel(
          name: 'name',
          phoneNumber: 'phoneNumber',
          email: 'email',
          ibanNumber: 'ibanNumber')
    ];
    test('should cache the auth CACHED_AUTH_TOKEN', () async {
      // arrange
      final tokenToCache =
          OrderDataModel(token: 'REQUESTED_TOKEN', cards: cards);
      // act
      await localDataSource.cacheCards(tokenToCache);
      // assert
      verify(mockSecureStorage.write(
        key: CACHED_USER_DATA,
        value: json.encode(tokenToCache.toJson()),
      ));
    });
  });
}
