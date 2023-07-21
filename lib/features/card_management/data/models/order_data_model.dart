import 'package:equatable/equatable.dart';

class OrderDataModel extends Equatable {
  OrderDataModel({
    required this.orderId,
    required this.dishes,
  });
  late final String orderId;
  late final List<DishModel> dishes;

  OrderDataModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    dishes =
        List.from(json['dishes']).map((e) => DishModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['order_id'] = orderId;
    _data['dishes'] = dishes.map((e) => e.toJson()).toList();
    return _data;
  }

  @override
  List<Object?> get props => [orderId, dishes];
}

class DishModel {
  DishModel({
    required this.boxNumber,
  });
  late final String boxNumber;

  DishModel.fromJson(Map<String, dynamic> json) {
    boxNumber = json['box_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['box_number'] = boxNumber;
    return _data;
  }
}
