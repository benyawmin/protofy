import 'package:equatable/equatable.dart';

class OrderDataModel extends Equatable {
  OrderDataModel({
    required this.orderId,
    required this.dishes,
  });
  late final String orderId;
  late final List<int> dishes;

  OrderDataModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    dishes = List.castFrom<dynamic, int>(json['dishes']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['order_id'] = orderId;
    _data['dishes'] = dishes;
    return _data;
  }

  @override
  List<Object?> get props => [orderId, dishes];
}