import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:dartz/dartz.dart';

//! The trick in this code is that if the conditions for a correct email and
//! password format, which were met during registration, are not met during
//! login, we reject the login without even connecting to the server
//! which helps reduce the server load a lot
class InputEmailValidation {
  Either<Failure, String> emailValidator(String email) {
    try {
      //! Email should meet the following regex conditions
      final bool validEmailFormat = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      if (!validEmailFormat)
        throw FormatException();
      else
        return Right(email);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
    // try {
    //   return Right(email);
    // } on FormatException {
    //   return Left(InvalidInputFailure());
    // }
  }
}

class InputPasswordValidation {
  Either<Failure, String> passwordValidator(String password) {
    try {
      //! Password should meet the regex conditions
      RegExp regex = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      if (!regex.hasMatch(password)) {
        throw FormatException();
      } else
        return Right(password);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
    // try {
    //   return Right(password);
    // } on FormatException {
    //   return Left(InvalidInputFailure());
    // }
  }
}
