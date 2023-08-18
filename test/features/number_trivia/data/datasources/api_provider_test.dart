import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:protofy/core/error/exceptions.dart';
import 'package:protofy/features/order_pickup/data/datasources/api_provider.dart';

import 'api_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ApiProvider apiProvider;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    apiProvider = ApiProvider();
  });

  group('getSaladData', () {
    test('should return salad data when the call to http client is successful',
        () async {
      // Arrange
      final mockResponse = http.Response('{"key": "value"}', 200);
      when(mockHttpClient.get(any)).thenAnswer((_) async => mockResponse);
      apiProvider.client = mockHttpClient;

      // Act
      final result = await apiProvider.getSaladData();

      // Assert
      expect(result, isA<Map<String, dynamic>>());
    });

    test(
      'should throw a ServerException when the call to http client is unsuccessful',
      () async {
        // Arrange
        final mockResponse = http.Response('Error', 404);
        when(mockHttpClient.get(any)).thenAnswer((_) async => mockResponse);
        apiProvider.client = mockHttpClient;

        // Act
        Future<dynamic> call() async => await apiProvider.getSaladData();

        // Assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });
}
