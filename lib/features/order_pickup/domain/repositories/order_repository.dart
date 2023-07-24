import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:dartz/dartz.dart';

// Blueprint (abstract) of the repository
abstract class OrderRepository {
  Future<Either<Failure, OrderData>> checkOrderID({required String orderId});
}
