import 'package:equatable/equatable.dart';

class DishEntity extends Equatable {
  final String boxNumber;

  DishEntity({
    required this.boxNumber,
  });

  @override
  List<Object?> get props => [boxNumber];
}
