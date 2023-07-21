import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/core/util/input_converter.dart';
import 'package:Goodbytz/features/card_management/domain/entities/dishes.dart';
import 'package:Goodbytz/features/card_management/domain/entities/order_data.dart';
import 'package:Goodbytz/features/card_management/domain/usecases/get_auth_data.dart';
import 'package:Goodbytz/features/card_management/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_bloc_test.mocks.dart';

@GenerateMocks([GetOrderData, InputEmailValidation])
void main() {
  group('LoginBloc', () {
    final List<DishEntity> cards = [DishEntity(boxNumber: '0')];
    late LoginBloc loginBloc;
    late MockGetAuthData mockGetAuthToken;
    late MockInputEmailValidation mockEmailValidation;
    late MockInputPasswordValidation mockPasswordValidation;

    setUp(() {
      mockGetAuthToken = MockGetAuthData();
      mockEmailValidation = MockInputEmailValidation();
      mockPasswordValidation = MockInputPasswordValidation();
      loginBloc = LoginBloc(
        getOrderData: mockGetAuthToken,
        inputOderIdValidation: mockEmailValidation,
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
        when(mockEmailValidation.orderIdValidatior(any))
            .thenReturn(Left(InvalidInputFailure()));
        when(mockPasswordValidation.passwordValidator(any))
            .thenReturn(Left(InvalidInputFailure()));
        return loginBloc;
      },
      act: (bloc) => bloc.add(AuthenticationRequest(orderId: '0')),
      expect: () => [
        AuthenticationInProgress(),
        AuthenticationError(message: INVALID_INPUT_FAILURE_MESSAGE),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [AuthenticationInProgress, AuthenticationError] when authentication fails',
      build: () {
        when(mockEmailValidation.orderIdValidatior(any))
            .thenReturn(Right('correct_email'));
        when(mockPasswordValidation.passwordValidator(any))
            .thenReturn(Right('correct_password'));
        when(mockGetAuthToken.call(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        return loginBloc;
      },
      act: (bloc) => bloc.add(AuthenticationRequest(
          orderId: '0')),
      expect: () => [
        AuthenticationInProgress(),
        AuthenticationError(message: SERVER_FAILURE_MESSAGE),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [AuthenticationInProgress, AuthenticationSuccess] when authentication succeeds',
      build: () {
        when(mockEmailValidation.orderIdValidatior(any))
            .thenReturn(Right('correct_email'));
        when(mockPasswordValidation.passwordValidator(any))
            .thenReturn(Right('correct_password'));
        when(mockGetAuthToken.call(any)).thenAnswer(
            (_) async => Right(OrderData(orderId: 'token', dishes: cards)));
        return loginBloc;
      },
      act: (bloc) => bloc.add(AuthenticationRequest(
          orderId: '0')),
      expect: () => [
        AuthenticationInProgress(),
        AuthenticationSuccess(
            orderData: OrderData(orderId: 'token', dishes: cards)),
      ],
    );
  });
}
