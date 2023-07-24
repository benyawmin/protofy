import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputOrderIDValidation inputEmailValidation;

  setUp(() {
    inputEmailValidation = InputOrderIDValidation();
  });

  group('Input email validation', () {
    test('Should return the email as a string when the email format is correct',
        () {
      // arrange
      const orderID = 'benyamin_jafari_2000';
      // act
      final result = inputEmailValidation.orderIdValidatior(orderID);
      // assert
      expect(result, const Right('benyamin_jafari_2000'));
    });

    test(
        'Should return [Left(InvalidInputFailure())] when the email format is NOT correct',
        () {
      // arrange
      const orderID = 'benyamin';
      // act
      final result = inputEmailValidation.orderIdValidatior(orderID);
      // assert
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
