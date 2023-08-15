// ignore_for_file: constant_identifier_names

import 'package:protofy/core/error/failures.dart';
import 'package:protofy/core/usecases/usecase.dart';
import 'package:protofy/core/util/input_converter.dart';
import 'package:protofy/features/order_pickup/data/models/order_data_model.dart';
import 'package:protofy/features/order_pickup/domain/entities/order_data.dart';
import 'package:protofy/features/order_pickup/domain/usecases/get_order_data.dart';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'order_input_event.dart';
part 'order_input_state.dart';

// Setting messages for each failure type
const String SERVER_FAILURE_MESSAGE = 'Wrong Order ID';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE = 'Invalid Order number';

// Business logic of the app goes here in the bloc
class OrderInputBloc extends Bloc<OrderInputEvent, SaladListState> {
  final GetOrderData getOrderData;
  final InputOrderIDValidation inputOderIdValidation;

  OrderInputBloc({
    required this.getOrderData,
    required this.inputOderIdValidation,
  }) : super(SaladListStateInitial()) {
    on<OrderIDAuthenticationRequest>((event, emit) async {
      emit(SaladListStateLoading());

      final orderIdEither =
          inputOderIdValidation.orderIdValidatior(event.orderId);

      bool isOrderIdValid = false;
      String correctOrderId = '';

      // Folding the Either type and act based on failure or successful data
      await orderIdEither.fold(
          (failure) async => emit(const SaladListStateError(
              message: INVALID_INPUT_FAILURE_MESSAGE)), (orderId) async {
        isOrderIdValid = true;
        correctOrderId = orderId;
      });

      if (isOrderIdValid) {
        final failureOrOrderId = await getOrderData(NoParams());
        await failureOrOrderId.fold(
            (failure) async => emit(
                SaladListStateError(message: _mapFailureToMessage(failure))),
            (orderData) async =>
                emit(SaladListStateLoaded(saladList: orderData)));
      }
    });

    on<LoadSaladList>((event, emit) async {
      emit(SaladListStateLoading());
      final failureOrSaladList = await getOrderData(NoParams());
      await failureOrSaladList.fold(
          (failure) async =>
              emit(SaladListStateError(message: _mapFailureToMessage(failure))),
          (saladList) async =>
              emit(SaladListStateLoaded(saladList: saladList)));
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
