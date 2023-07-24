import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_pickup_event.dart';
part 'order_pickup_state.dart';

class OrderPickupBloc extends Bloc<OrderPickupEvent, OrderPickupState> {
  OrderPickupBloc() : super(OrderPickupInitial()) {
    on<OrderPickupEvent>((event, emit) {
      // TODO: implement event handler (Blueprint for future usage)
    });
  }
}
