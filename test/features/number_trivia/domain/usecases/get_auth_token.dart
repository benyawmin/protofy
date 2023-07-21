import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/features/card_management/domain/entities/dishes.dart';
import 'package:Goodbytz/features/card_management/domain/entities/order_data.dart';
import 'package:Goodbytz/features/card_management/domain/repositories/auth_repository.dart';
import 'package:Goodbytz/features/card_management/domain/usecases/get_auth_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_auth_token.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late GetOrderData usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = GetOrderData(mockAuthRepository);
  });

  group('call', () {
    final List<DishEntity> cards = [DishEntity(boxNumber: '0')];
    final email = 'email';
    final password = 'password';
    final params = Params(orderId: email);
    final userAuth = OrderData(orderId: 'token', dishes: cards);

    test('should return UserAuth from the repository', () async {
      // arrange
      when(mockAuthRepository.authentication(
              orderId: email, password: password))
          .thenAnswer((_) async => Right(userAuth));

      // act
      final result = await usecase(params);

      // assert
      expect(result, equals(Right(userAuth)));
      verify(mockAuthRepository.authentication(
          orderId: email, password: password));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return a failure from the repository', () async {
      // arrange
      final failure = ServerFailure();
      when(mockAuthRepository.authentication(
              orderId: email, password: password))
          .thenAnswer((_) async => Left(failure));

      // act
      final result = await usecase(params);

      // assert
      expect(result, equals(Left(failure)));
      verify(mockAuthRepository.authentication(
          orderId: email, password: password));
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
