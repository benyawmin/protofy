part of 'salad_list_bloc.dart';

abstract class SaladListEvent extends Equatable {
  const SaladListEvent();

  @override
  List<Object> get props => [];
}

// Load the salad list based on the api data
class LoadSaladList extends SaladListEvent {
  @override
  List<Object> get props => [];
}
