import 'package:equatable/equatable.dart';

// Order data model which is an order id and list of the ready dishes
class OrderDataModel extends Equatable {
  late final String orderId;
  late final List<int> dishes;

  // ignore: prefer_const_constructors_in_immutables
  OrderDataModel({
    required this.orderId,
    required this.dishes,
  });

  // Converting the received data from json
  OrderDataModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    dishes = List.castFrom<dynamic, int>(json['dishes']);
  }

  // Conver the data to json
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['dishes'] = dishes;
    return data;
  }

  // Sending the props to the Equatable for overriding the == operator
  @override
  List<Object?> get props => [orderId, dishes];
}
