import 'package:equatable/equatable.dart';

class OrderData extends Equatable {
  final String orderId;
  final List<int> dishes;

  OrderData({required this.orderId, required this.dishes});

  @override
  List<Object?> get props => [orderId, dishes];
}
