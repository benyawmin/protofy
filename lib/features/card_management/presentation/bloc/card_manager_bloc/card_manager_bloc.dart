import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'card_manager_event.dart';
part 'card_manager_state.dart';

class CardManagerBloc extends Bloc<CardManagerEvent, CardManagerState> {
  CardManagerBloc() : super(CardManagerInitial()) {
    on<CardManagerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
