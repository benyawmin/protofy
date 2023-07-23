import 'package:equatable/equatable.dart';

class OrderDataModel extends Equatable {
  late final String orderId;
  late final List<int> dishes;

  OrderDataModel({
    required this.orderId,
    required this.dishes,
  });

  OrderDataModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    dishes = List.castFrom<dynamic, int>(json['dishes']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['dishes'] = dishes;
    return data;
  }

  @override
  List<Object?> get props => [orderId, dishes];
}
