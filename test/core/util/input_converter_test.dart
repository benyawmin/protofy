import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputEmailValidation inputEmailValidation;

  setUp(() {
    inputEmailValidation = InputEmailValidation();
  });

  group('Input email validation', () {
    test('Should return the email as a string when the email format is correct',
        () {
      // arrange
      final email = 'benyamin@email.com';
      // act
      final result = inputEmailValidation.orderIdValidatior(email);
      // assert
      expect(result, Right('benyamin@email.com'));
    });

    test(
        'Should return [Left(InvalidInputFailure())] when the email format is NOT correct',
        () {
      // arrange
      final email = 'benyamin';
      // act
      final result = inputEmailValidation.orderIdValidatior(email);
      // assert
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
