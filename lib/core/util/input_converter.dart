import 'package:Goodbytz/core/error/failures.dart';
import 'package:dartz/dartz.dart';

//! The trick in this code is that if the criteria for a correct orderId
//! format are not met, we reject the Pick up without even connecting to the server
//! which helps reduce the server load a lot
class InputOrderIDValidation {
  Either<Failure, String> orderIdValidatior(String orderId) {
    try {
      //! OrderId should meet the following regex conditions
      // Order ID format should be NAME_LASTNAME_NUMBER
      final bool validEmailFormat =
          RegExp(r"^[a-zA-Z]+_[a-zA-Z]+_\d+$").hasMatch(orderId);
      if (!validEmailFormat) {
        throw const FormatException();
      } else {
        return Right(orderId);
      }
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}
