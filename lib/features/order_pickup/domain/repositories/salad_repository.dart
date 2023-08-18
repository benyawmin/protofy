import 'package:protofy/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';

// Blueprint (abstract) of the repository
abstract class SaladRepository {
  Future<Either<Failure, StadtSalatModel>> getSaladListOfData();
}
