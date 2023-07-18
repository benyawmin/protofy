import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/entities/credit_card.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/entities/user_data.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/usecases/get_auth_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_auth_token.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late GetAuthData usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = GetAuthData(mockAuthRepository);
  });

  group('call', () {
    final List<CreditCard> cards = [
      CreditCard(
          name: 'name',
          phoneNumber: 'phoneNumber',
          email: 'email',
          ibanNumber: 'ibanNumber')
    ];
    final email = 'email';
    final password = 'password';
    final params = Params(email: email, password: password);
    final userAuth = UserData(token: 'token', cards: cards);

    test('should return UserAuth from the repository', () async {
      // arrange
      when(mockAuthRepository.authentication(email: email, password: password))
          .thenAnswer((_) async => Right(userAuth));

      // act
      final result = await usecase(params);

      // assert
      expect(result, equals(Right(userAuth)));
      verify(
          mockAuthRepository.authentication(email: email, password: password));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return a failure from the repository', () async {
      // arrange
      final failure = ServerFailure();
      when(mockAuthRepository.authentication(email: email, password: password))
          .thenAnswer((_) async => Left(failure));

      // act
      final result = await usecase(params);

      // assert
      expect(result, equals(Left(failure)));
      verify(
          mockAuthRepository.authentication(email: email, password: password));
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
