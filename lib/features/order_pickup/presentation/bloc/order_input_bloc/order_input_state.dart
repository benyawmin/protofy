part of 'order_input_bloc.dart';

abstract class OrderInputState extends Equatable {
  const OrderInputState();

  @override
  List<Object> get props => [];
}

// Initial state of the order id page
class OrderIDAuthenticationInitial extends OrderInputState {}

// In progress state of the order id page (after clicking the button show loadig)
class OrderIDAuthenticationInProgress extends OrderInputState {}

// If the order ID was correct and everything went ok emit this state
class OrderIDAuthenticationSuccess extends OrderInputState {
  final OrderData orderData;

  const OrderIDAuthenticationSuccess({required this.orderData});

  @override
  List<Object> get props => [orderData];
}

// Emit this state if an error happend during the Order ID Authentication process
class OrderIDAuthenticationError extends OrderInputState {
  final String message;

  const OrderIDAuthenticationError({required this.message});

  @override
  List<Object> get props => [message];
}
