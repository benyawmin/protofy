import 'package:bloc/bloc.dart';
import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/core/util/input_converter.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/entities/user_data.dart';
import 'package:clean_architecture_tdd_course/features/card_management/domain/usecases/get_auth_data.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetAuthData getAuthToken;
  final InputEmailValidation inputEmailValidation;
  final InputPasswordValidation inputPasswordValidation;

  LoginBloc(
      {required this.getAuthToken,
      required this.inputEmailValidation,
      required this.inputPasswordValidation})
      : super(AuthenticationInitial()) {
    on<AuthenticationRequest>((event, emit) async {
      emit(AuthenticationInProgress());

      final emailInputEither = inputEmailValidation.emailValidator(event.email);
      final passwordInputEither =
          inputPasswordValidation.passwordValidator(event.password);
      bool isEmailValid = false;
      bool isPassWordValid = false;
      String correctEmail = '';
      String correctPassword = '';

      await emailInputEither.fold(
          (failure) async =>
              emit(AuthenticationError(message: INVALID_INPUT_FAILURE_MESSAGE)),
          (email) async {
        isEmailValid = true;
        correctEmail = email;
      });

      await passwordInputEither.fold(
          (failure) async =>
              emit(AuthenticationError(message: INVALID_INPUT_FAILURE_MESSAGE)),
          (password) async {
        isPassWordValid = true;
        correctPassword = password;
      });
      if (isEmailValid && isPassWordValid) {
        final failureOrEmail = await getAuthToken(
            Params(email: correctEmail, password: correctPassword));
        await failureOrEmail.fold(
            (failure) async => emit(
                AuthenticationError(message: _mapFailureToMessage(failure))),
            (userData) async => emit(AuthenticationSuccess(userData: userData)));
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
