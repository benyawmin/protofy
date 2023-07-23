part of 'order_input_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends LoginState {}

class AuthenticationInProgress extends LoginState {}

class AuthenticationSuccess extends LoginState {
  final OrderData orderData;

  const AuthenticationSuccess({required this.orderData});

  @override
  List<Object> get props => [orderData];
}

class AuthenticationError extends LoginState {
  final String message;

  const AuthenticationError({required this.message});

  @override
  List<Object> get props => [message];
}
