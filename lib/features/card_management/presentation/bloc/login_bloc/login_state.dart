part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends LoginState {}

class AuthenticationInProgress extends LoginState {}

class AuthenticationSuccess extends LoginState {
  final UserData userData;

  AuthenticationSuccess({required this.userData});

  @override
  List<Object> get props => [userData];
}

class AuthenticationError extends LoginState {
  final String message;

  AuthenticationError({required this.message});

  @override
  List<Object> get props => [message];
}
