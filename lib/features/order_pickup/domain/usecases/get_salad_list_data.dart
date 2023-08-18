import 'package:protofy/core/error/failures.dart';
import 'package:protofy/core/usecases/usecase.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';
import 'package:protofy/features/order_pickup/domain/repositories/salad_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Providing the data gotten from outside to the app
class GetSaladListData implements UseCase<StadtSalatModel, NoParams> {
  final SaladRepository repository;

  GetSaladListData(this.repository);

  @override
  // Callable class was used here (call should be the name of the function)
  Future<Either<Failure, StadtSalatModel>> call(NoParams params) async {
    return await repository.getSaladListOfData();
  }
}

class Params extends Equatable {
  final String param;

  const Params({required this.param});

  @override
  List<Object?> get props => [param];
}
