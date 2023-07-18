import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputEmailValidation inputEmailValidation;
  late InputPasswordValidation inputPasswordValidation;

  setUp(() {
    inputEmailValidation = InputEmailValidation();
    inputPasswordValidation = InputPasswordValidation();
  });

  group('Input email validation', () {
    test('Should return the email as a string when the email format is correct',
        () {
      // arrange
      final email = 'benyamin@email.com';
      // act
      final result = inputEmailValidation.emailValidator(email);
      // assert
      expect(result, Right('benyamin@email.com'));
    });

    test(
        'Should return [Left(InvalidInputFailure())] when the email format is NOT correct',
        () {
      // arrange
      final email = 'benyamin';
      // act
      final result = inputEmailValidation.emailValidator(email);
      // assert
      expect(result, Left(InvalidInputFailure()));
    });
  });

  group('Input password validation', () {
    test(
        'Should return the password as a string when the password format is correct',
        () {
      // arrange
      final password = 'Benyam!n2000';
      // act
      final result = inputPasswordValidation.passwordValidator(password);
      // assert
      expect(result, Right('Benyam!n2000'));
    });

    test(
        'Should return [Left(InvalidInputFailure())] when the password format is NOT correct',
        () {
      // arrange
      final email = 'benyamin';
      // act
      final result = inputEmailValidation.emailValidator(email);
      // assert
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
