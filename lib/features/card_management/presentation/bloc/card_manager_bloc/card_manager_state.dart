part of 'card_manager_bloc.dart';

abstract class CardManagerState extends Equatable {
  const CardManagerState();
  
  @override
  List<Object> get props => [];
}

class CardManagerInitial extends CardManagerState {}
