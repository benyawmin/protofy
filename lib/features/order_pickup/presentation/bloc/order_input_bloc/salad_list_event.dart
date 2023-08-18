part of 'salad_list_bloc.dart';

abstract class OrderInputEvent extends Equatable {
  const OrderInputEvent();

  @override
  List<Object> get props => [];
}

class LoadSaladList extends OrderInputEvent {
  @override
  List<Object> get props => [];
}
