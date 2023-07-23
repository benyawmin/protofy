part of 'order_input_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationRequest extends LoginEvent {
  final String orderId;

  const AuthenticationRequest({required this.orderId});

  @override
  List<Object> get props => [orderId];
}
