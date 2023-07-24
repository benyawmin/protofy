part of 'order_input_bloc.dart';

abstract class OrderInputState extends Equatable {
  const OrderInputState();

  @override
  List<Object> get props => [];
}

class OrderIDAuthenticationInitial extends OrderInputState {}

class OrderIDAuthenticationInProgress extends OrderInputState {}

class OrderIDAuthenticationSuccess extends OrderInputState {
  final OrderData orderData;

  const OrderIDAuthenticationSuccess({required this.orderData});

  @override
  List<Object> get props => [orderData];
}

class OrderIDAuthenticationError extends OrderInputState {
  final String message;

  const OrderIDAuthenticationError({required this.message});

  @override
  List<Object> get props => [message];
}
