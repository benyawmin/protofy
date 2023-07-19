import 'package:Enter/core/error/failures.dart';
import 'package:Enter/features/card_management/domain/entities/user_data.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserData>> authentication(
      {required String email, required String password});
}