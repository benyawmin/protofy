import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:protofy/core/error/exceptions.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'package:protofy/features/order_pickup/data/datasources/remote_data_source.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';

import '../datasources/remote_data_source_test.mocks.dart';

void main() {
  late RemoteDataSourceImpl remoteDataSource;
  late MockApiProvider mockApiProvider;

  setUp(() {
    mockApiProvider = MockApiProvider();
    remoteDataSource = RemoteDataSourceImpl(apiProvider: mockApiProvider);
  });

  group('getSaladData', () {
    final saladData = json.decode(fixture('sample_map.json'));

    final expectedSaladModel = StadtSalatModel.fromJson(saladData);

    test(
      'should return SaladModel when the call to ApiProvider is successful',
      () async {
        // Arrange
        when(mockApiProvider.getSaladData()).thenAnswer((_) async => saladData);

        // Act
        final result = await remoteDataSource.getSaladData();

        // Assert
        expect(result, equals(expectedSaladModel));
        verify(mockApiProvider.getSaladData());
      },
    );

    test(
      'should throw a ServerException when the call to ApiProvider is unsuccessful',
      () async {
        // Arrange
        when(mockApiProvider.getSaladData()).thenThrow(ServerException());

        // Act
        final call = remoteDataSource.getSaladData;

        // Assert
        expect(call(), throwsA(isInstanceOf<ServerException>()));
        verify(mockApiProvider.getSaladData());
      },
    );
  });
}
