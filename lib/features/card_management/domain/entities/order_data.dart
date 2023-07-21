import 'package:Goodbytz/features/card_management/data/models/order_data_model.dart';
import 'package:equatable/equatable.dart';

class OrderData extends Equatable {
  final String orderId;
  final List<DishModel> dishes;

  OrderData({required this.orderId, required this.dishes});

  @override
  List<Object?> get props => [orderId, dishes];
}
