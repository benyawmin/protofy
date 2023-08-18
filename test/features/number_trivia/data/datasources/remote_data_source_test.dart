import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:protofy/core/error/exceptions.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:protofy/features/order_pickup/data/datasources/remote_data_source.dart';
import 'package:protofy/features/order_pickup/data/datasources/api_provider.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';

import 'remote_data_source_test.mocks.dart';

@GenerateMocks([ApiProvider])
void main() {
  late MockApiProvider mockApiProvider;
  late RemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiProvider = MockApiProvider();
    dataSource = RemoteDataSourceImpl(apiProvider: mockApiProvider);
  });

  group('getSaladData', () {
    final testData = json.decode(fixture('sample_map.json')); // Replace this with your test data

    test('should return salad data when the call to ApiProvider is successful',
        () async {
      // Arrange
      when(mockApiProvider.getSaladData()).thenAnswer((_) async => testData);

      // Act
      final result = await dataSource.getSaladData();

      // Assert
      expect(result, equals(StadtSalatModel.fromJson(testData)));
    });

    test(
        'should throw ServerException when the call to ApiProvider is unsuccessful',
        () async {
      // Arrange
      when(mockApiProvider.getSaladData()).thenThrow(ServerException());

      // Act
      final call = dataSource.getSaladData();

      // Assert
      expect(call, throwsA(isA<ServerException>()));
    });
  });
}
