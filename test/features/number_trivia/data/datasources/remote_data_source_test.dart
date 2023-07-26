import 'package:Goodbytz/core/error/exceptions.dart';
import 'package:Goodbytz/features/order_pickup/data/datasources/remote_data_source.dart';
import 'package:Goodbytz/features/order_pickup/data/models/order_data_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late RemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = RemoteDataSourceImpl();
  });

  group('getOrderData', () {
    const orderID = 'haritha_kumar_2000';
    final dishes = [0, 2, 6];
    test('should return a OrderDataModel when order ID is correct', () async {
      // Arrange
      const correctOrderID = 'haritha_kumar_2000';
      final expectedToken = OrderDataModel(orderId: orderID, dishes: dishes);

      // Act
      final result = await remoteDataSource.getOrderData(correctOrderID);

      // Assert
      expect(result, isNotNull);
      expect(result, equals(expectedToken));
    });

    test(
        'should throw a ServerException when the server response was unexcpected (for example wrong order id)',
        () async {
      // Arrange
      const wrongOrderID = 'benyaminn';

      // Act
      final call = remoteDataSource.getOrderData(wrongOrderID);

      // Assert
      expect(call, throwsA(isA<ServerException>()));
    });
  });
}
