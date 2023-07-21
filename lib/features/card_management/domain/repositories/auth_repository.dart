import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/features/card_management/domain/entities/order_data.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, OrderData>> authentication({required String orderId});
}
