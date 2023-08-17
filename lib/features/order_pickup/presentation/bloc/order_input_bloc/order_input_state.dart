part of 'order_input_bloc.dart';

abstract class SaladListState extends Equatable {
  const SaladListState();

  @override
  List<Object> get props => [];
}

// Initial state of the order id page
class SaladListStateInitial extends SaladListState {}

// In progress state of the order id page (after clicking the button show loadig)
class SaladListStateLoading extends SaladListState {}

// If the order ID was correct and everything went ok emit this state
class SaladListStateLoaded extends SaladListState {
  final List saladList;

  const SaladListStateLoaded({required this.saladList});

  @override
  List<Object> get props => [saladList];
}

// Emit this state if an error happend during the Order ID Authentication process
class SaladListStateError extends SaladListState {
  final String message;

  const SaladListStateError({required this.message});

  @override
  List<Object> get props => [message];
}