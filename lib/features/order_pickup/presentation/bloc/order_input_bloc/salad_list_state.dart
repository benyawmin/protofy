part of 'salad_list_bloc.dart';

abstract class SaladListState extends Equatable {
  const SaladListState();

  @override
  List<Object> get props => [];
}

// Initial state
class SaladListStateInitial extends SaladListState {}

// Emit if progress state of the salad list page
class SaladListStateLoading extends SaladListState {}

// Emit if the salad list page is loaded
class SaladListStateLoaded extends SaladListState {
  final StadtSalatModel saladList;

  const SaladListStateLoaded({required this.saladList});

  @override
  List<Object> get props => [saladList];
}

// Emit if an error happened
class SaladListStateError extends SaladListState {
  final String message;

  const SaladListStateError({required this.message});

  @override
  List<Object> get props => [message];
}