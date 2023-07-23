part of 'order_pickup_bloc.dart';

abstract class OrderPickupState extends Equatable {
  const OrderPickupState();
  
  @override
  List<Object> get props => [];
}

class OrderPickupInitial extends OrderPickupState {}
