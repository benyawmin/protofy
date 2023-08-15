import 'package:protofy/core/error/failures.dart';
import 'package:protofy/core/usecases/usecase.dart';
import 'package:protofy/features/order_pickup/data/models/order_data_model.dart';
import 'package:protofy/features/order_pickup/domain/repositories/order_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Providing the data gotten from outside to the app
class GetOrderData implements UseCase<StadtSalatModel, Params> {
  final OrderRepository repository;

  GetOrderData(this.repository);

  @override
  // Callable class was used here (call should be the name of the function)
  Future<Either<Failure, StadtSalatModel>> call(Params params) async {
    return await repository.checkOrderID();
  }
}

class Params extends Equatable {
  final String orderId;

  const Params({required this.orderId});

  @override
  List<Object?> get props => [orderId];
}
