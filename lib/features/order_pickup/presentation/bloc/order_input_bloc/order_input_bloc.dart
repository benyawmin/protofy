// ignore_for_file: constant_identifier_names

import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/core/util/input_converter.dart';
import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/domain/usecases/get_order_data.dart';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'order_input_event.dart';
part 'order_input_state.dart';

// Setting messages for each failure type
const String SERVER_FAILURE_MESSAGE = 'Wrong Order ID';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE = 'Invalid Order number';

// Business logic of the app goes here in the bloc
class OrderInputBloc extends Bloc<OrderInputEvent, OrderInputState> {
  final GetOrderData getOrderData;
  final InputOrderIDValidation inputOderIdValidation;

  OrderInputBloc({
    required this.getOrderData,
    required this.inputOderIdValidation,
  }) : super(OrderIDAuthenticationInitial()) {
    on<OrderIDAuthenticationRequest>((event, emit) async {
      emit(OrderIDAuthenticationInProgress());

      final orderIdEither =
          inputOderIdValidation.orderIdValidatior(event.orderId);

      bool isOrderIdValid = false;
      String correctOrderId = '';

      // Folding the Either type and act based on failure or successful data
      await orderIdEither.fold(
          (failure) async => emit(const OrderIDAuthenticationError(
              message: INVALID_INPUT_FAILURE_MESSAGE)), (orderId) async {
        isOrderIdValid = true;
        correctOrderId = orderId;
      });

      if (isOrderIdValid) {
        final failureOrOrderId =
            await getOrderData(Params(orderId: correctOrderId));
        await failureOrOrderId.fold(
            (failure) async => emit(OrderIDAuthenticationError(
                message: _mapFailureToMessage(failure))),
            (orderData) async =>
                emit(OrderIDAuthenticationSuccess(orderData: orderData)));
      }
    });
  }

  // Mapping each of the failures to a message
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case InvalidInputFailure:
        return INVALID_INPUT_FAILURE_MESSAGE;
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
