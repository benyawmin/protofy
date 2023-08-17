import 'package:protofy/core/error/failures.dart';
import 'package:protofy/core/util/input_converter.dart';
import 'package:protofy/features/order_pickup/domain/entities/order_data.dart';
import 'package:protofy/features/order_pickup/domain/usecases/get_order_data.dart';
import 'package:protofy/features/order_pickup/presentation/bloc/order_input_bloc/salad_list_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_bloc_test.mocks.dart';

@GenerateMocks([GetOrderData, InputOrderIDValidation])
void main() {
  group('LoginBloc', () {
    final List<int> dishes = [0, 2, 6];
    late SaladListBloc loginBloc;
    late MockGetOrderData mockGetAuthToken;
    late MockInputOrderIDValidation mockInputOrderIDValidation;

    setUp(() {
      mockGetAuthToken = MockGetOrderData();
      mockInputOrderIDValidation = MockInputOrderIDValidation();
      loginBloc = SaladListBloc(
        getOrderData: mockGetAuthToken,
        inputOderIdValidation: mockInputOrderIDValidation,
      );
    });

    tearDown(() {
      loginBloc.close();
    });

    test('initial state should be AuthenticationInitial', () {
      expect(loginBloc.state, SaladListStateInitial());
    });

    blocTest<SaladListBloc, SaladListState>(
      'emits [AuthenticationInProgress, AuthenticationError] when input validation fails',
      build: () {
        when(mockInputOrderIDValidation.orderIdValidatior(any))
            .thenReturn(Left(InvalidInputFailure()));
        return loginBloc;
      },
      act: (bloc) => bloc.add(const OrderIDAuthenticationRequest(orderId: '0')),
      expect: () => [
        SaladListStateLoading(),
        const SaladListStateError(message: INVALID_INPUT_FAILURE_MESSAGE),
      ],
    );

    blocTest<SaladListBloc, SaladListState>(
      'emits [AuthenticationInProgress, AuthenticationError] when authentication fails',
      build: () {
        when(mockInputOrderIDValidation.orderIdValidatior(any))
            .thenReturn(const Right('correct_order_id'));
        when(mockGetAuthToken.call(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        return loginBloc;
      },
      act: (bloc) => bloc.add(const OrderIDAuthenticationRequest(orderId: '0')),
      expect: () => [
        SaladListStateLoading(),
        const SaladListStateError(message: SERVER_FAILURE_MESSAGE),
      ],
    );

    blocTest<SaladListBloc, SaladListState>(
      'emits [AuthenticationInProgress, AuthenticationSuccess] when authentication succeeds',
      build: () {
        when(mockInputOrderIDValidation.orderIdValidatior(any))
            .thenReturn(const Right('correct_email'));
        when(mockGetAuthToken.call(any)).thenAnswer((_) async =>
            Right(StadtSalatModel(orderID: 'token', dishes: dishes)));
        return loginBloc;
      },
      act: (bloc) => bloc.add(const OrderIDAuthenticationRequest(orderId: '0')),
      expect: () => [
        SaladListStateLoading(),
        SaladListStateLoaded(
            saladList: StadtSalatModel(orderID: 'token', dishes: dishes)),
      ],
    );
  });
}
