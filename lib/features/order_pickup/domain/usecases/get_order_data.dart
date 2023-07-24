import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/core/usecases/usecase.dart';
import 'package:Goodbytz/features/order_pickup/domain/entities/order_data.dart';
import 'package:Goodbytz/features/order_pickup/domain/repositories/order_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Providing the data gotten from outside to the app
class GetOrderData implements UseCase<OrderData, Params> {
  final OrderRepository repository;

  GetOrderData(this.repository);

  @override
  // Callable class was used here (call should be the name of the function)
  Future<Either<Failure, OrderData>> call(Params params) async {
    return await repository.checkOrderID(orderId: params.orderId);
  }
}

class Params extends Equatable {
  final String orderId;

  const Params({required this.orderId});

  @override
  List<Object?> get props => [orderId];
}
