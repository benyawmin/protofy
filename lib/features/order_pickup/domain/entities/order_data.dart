import 'package:equatable/equatable.dart';

// The OrderData entity with an orderID and the list of dishes numbers
// ignore: must_be_immutable
class OrderData extends Equatable {
  String orderID;
  List<int> dishes;

  OrderData({required this.orderID, required this.dishes});

  // Sending the props to the Equatable for overriding the == operator
  @override
  List<Object?> get props => [orderID, dishes];
}
