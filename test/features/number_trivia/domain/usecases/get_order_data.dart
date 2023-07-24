import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/domain/repositories/order_repository.dart';
import 'package:Goodbytz/features/order_pickup/domain/usecases/get_order_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_order_data.mocks.dart';

@GenerateMocks([OrderRepository])
void main() {
  late GetOrderData usecase;
  late MockOrderRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockOrderRepository();
    usecase = GetOrderData(mockAuthRepository);
  });

  group('call', () {
    final List<int> dishes = [0, 2, 6];
    const orderID = 'benyamin_jafari_2000';
    const params = Params(orderId: orderID);
    final userAuth = OrderData(orderID: 'token', dishes: dishes);

    test('should return UserAuth from the repository', () async {
      // arrange
      when(mockAuthRepository.checkOrderID(orderId: orderID))
          .thenAnswer((_) async => Right(userAuth));

      // act
      final result = await usecase(params);

      // assert
      expect(result, equals(Right(userAuth)));
      verify(mockAuthRepository.checkOrderID(orderId: orderID));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return a failure from the repository', () async {
      // arrange
      final failure = ServerFailure();
      when(mockAuthRepository.checkOrderID(orderId: orderID))
          .thenAnswer((_) async => Left(failure));

      // act
      final result = await usecase(params);

      // assert
      expect(result, equals(Left(failure)));
      verify(mockAuthRepository.checkOrderID(orderId: orderID));
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
