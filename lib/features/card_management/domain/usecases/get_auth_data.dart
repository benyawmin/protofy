import 'package:Goodbytz/core/error/failures.dart';
import 'package:Goodbytz/core/usecases/usecase.dart';
import 'package:Goodbytz/features/card_management/domain/entities/order_data.dart';
import 'package:Goodbytz/features/card_management/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetOrderData implements UseCase<OrderData, Params> {
  final AuthRepository repository;

  GetOrderData(this.repository);

  @override
  // Callable class was used here (call should be the name of the function)
  Future<Either<Failure, OrderData>> call(Params params) async {
    return await repository.authentication(orderId: params.orderId);
  }
}

class Params extends Equatable {
  final String orderId;

  Params({required this.orderId});

  @override
  List<Object?> get props => [orderId];
}
