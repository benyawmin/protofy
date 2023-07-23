import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/core/util/input_converter.dart';
import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/domain/usecases/get_order_data.dart';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'order_input_event.dart';
part 'order_input_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Order does not exist';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE = 'Invalid Order number';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetOrderData getOrderData;
  final InputOrderIDValidation inputOderIdValidation;

  LoginBloc({
    required this.getOrderData,
    required this.inputOderIdValidation,
  }) : super(AuthenticationInitial()) {
    on<AuthenticationRequest>((event, emit) async {
      emit(AuthenticationInProgress());

      final orderIdEither =
          inputOderIdValidation.orderIdValidatior(event.orderId);

      bool isOrderIdValid = false;
      String correctOrderId = '';

      await orderIdEither.fold(
          (failure) async =>
              emit(AuthenticationError(message: INVALID_INPUT_FAILURE_MESSAGE)),
          (orderId) async {
        isOrderIdValid = true;
        correctOrderId = orderId;
      });

      if (isOrderIdValid) {
        final failureOrOrderId =
            await getOrderData(Params(orderId: correctOrderId));
        await failureOrOrderId.fold(
            (failure) async => emit(
                AuthenticationError(message: _mapFailureToMessage(failure))),
            (orderData) async =>
                emit(AuthenticationSuccess(orderData: orderData)));
      }
    });
  }

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
