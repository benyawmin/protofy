import 'package:Goodbytz/features/order_pickup/data/datasources/fake_server.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FakeServerImpl', () {
    late FakeServerImpl apiFakeServer;

    setUp(() {
      apiFakeServer = FakeServerImpl();
    });

    test(
        'Should return the order data for the correct order id',
        () async {
      // arrange
      const String orderID = 'haritha_kumar_2000';
      const String serverCorrectResponse =
          '{ "order_id": "haritha_kumar_2000", "dishes": [ 0, 2, 6 ] }';
      // act

      final response = await apiFakeServer.getOrderDataFromApi(
        orderID,
      );
      // assert
      expect(response.statusCode, 200);
      expect(response.body, serverCorrectResponse);
    });

    test('should return a 404 error for the wrong email and password input',
        () async {
      final response = await apiFakeServer.getOrderDataFromApi('dsa');

      expect(response.statusCode, 404);
      expect(response.body, '{}');
    });
  });
}
