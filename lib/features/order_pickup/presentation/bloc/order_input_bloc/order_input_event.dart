part of 'order_input_bloc.dart';

abstract class OrderInputEvent extends Equatable {
  const OrderInputEvent();

  @override
  List<Object> get props => [];
}

// This event will be called when user clicks the pickup order button after
// Entering the order ID
class OrderIDAuthenticationRequest extends OrderInputEvent {
  final String orderId;

  const OrderIDAuthenticationRequest({required this.orderId});

  @override
  List<Object> get props => [orderId];
}
