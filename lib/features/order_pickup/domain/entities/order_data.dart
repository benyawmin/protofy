import 'package:equatable/equatable.dart';

// The OrderData entity with an orderID and the list of dishes numbers
class OrderData extends Equatable {
  final String orderID;
  final List<int> dishes;

  const OrderData({required this.orderID, required this.dishes});

  @override
  List<Object?> get props => [orderID, dishes];
}
