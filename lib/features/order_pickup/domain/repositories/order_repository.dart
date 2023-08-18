import 'package:protofy/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:protofy/features/order_pickup/data/models/order_data_model.dart';

// Blueprint (abstract) of the repository
abstract class OrderRepository {
  Future<Either<Failure, StadtSalatModel>> checkOrderID();
}
