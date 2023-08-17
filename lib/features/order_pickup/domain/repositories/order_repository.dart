import 'package:protofy/core/error/failures.dart';
import 'package:dartz/dartz.dart';

// Blueprint (abstract) of the repository
abstract class OrderRepository {
  Future<Either<Failure, List>> checkOrderID();
}
