import 'package:bloc_test/bloc_test.dart';
import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/core/util/input_converter.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/models/user_data_model.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/entities/credit_card.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/entities/user_data.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/usecases/get_auth_data.dart';
import 'package:clean_architecture_tdd_course/features/card_management/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_bloc_test.mocks.dart';

@GenerateMocks([GetAuthData, InputEmailValidation, InputPasswordValidation])
void main() {
  group('LoginBloc', () {
    final List<CreditCard> cards = [
      CreditCard(
          name: 'name',
          phoneNumber: 'phoneNumber',
          email: 'email',
          ibanNumber: 'ibanNumber')
    ];
    late LoginBloc loginBloc;
    late MockGetAuthToken mockGetAuthToken;
    late MockInputEmailValidation mockEmailValidation;
    late MockInputPasswordValidation mockPasswordValidation;

    setUp(() {
      mockGetAuthToken = MockGetAuthToken();
      mockEmailValidation = MockInputEmailValidation();
      mockPasswordValidation = MockInputPasswordValidation();
      loginBloc = LoginBloc(
        getAuthToken: mockGetAuthToken,
        inputEmailValidation: mockEmailValidation,
        inputPasswordValidation: mockPasswordValidation,
      );
    });

    tearDown(() {
      loginBloc.close();
    });

    test('initial state should be AuthenticationInitial', () {
      expect(loginBloc.state, AuthenticationInitial());
    });

    blocTest<LoginBloc, LoginState>(
      'emits [AuthenticationInProgress, AuthenticationError] when input validation fails',
      build: () {
        when(mockEmailValidation.emailValidator(any))
            .thenReturn(Left(InvalidInputFailure()));
        when(mockPasswordValidation.passwordValidator(any))
            .thenReturn(Left(InvalidInputFailure()));
        return loginBloc;
      },
      act: (bloc) => bloc.add(AuthenticationRequest(
          email: 'incorrect_email', password: 'incorrect_password')),
      expect: () => [
        AuthenticationInProgress(),
        AuthenticationError(message: INVALID_INPUT_FAILURE_MESSAGE),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [AuthenticationInProgress, AuthenticationError] when authentication fails',
      build: () {
        when(mockEmailValidation.emailValidator(any))
            .thenReturn(Right('correct_email'));
        when(mockPasswordValidation.passwordValidator(any))
            .thenReturn(Right('correct_password'));
        when(mockGetAuthToken.call(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        return loginBloc;
      },
      act: (bloc) => bloc.add(AuthenticationRequest(
          email: 'correct_email', password: 'correct_password')),
      expect: () => [
        AuthenticationInProgress(),
        AuthenticationError(message: SERVER_FAILURE_MESSAGE),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [AuthenticationInProgress, AuthenticationSuccess] when authentication succeeds',
      build: () {
        when(mockEmailValidation.emailValidator(any))
            .thenReturn(Right('correct_email'));
        when(mockPasswordValidation.passwordValidator(any))
            .thenReturn(Right('correct_password'));
        when(mockGetAuthToken.call(any)).thenAnswer(
            (_) async => Right(UserData(token: 'token', cards: cards)));
        return loginBloc;
      },
      act: (bloc) => bloc.add(AuthenticationRequest(
          email: 'correct_email', password: 'correct_password')),
      expect: () => [
        AuthenticationInProgress(),
        AuthenticationSuccess(
            userData: UserData(token: 'token', cards: cards)),
      ],
    );
  });
}
