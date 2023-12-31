// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:protofy/core/error/failures.dart';
import 'package:protofy/core/usecases/usecase.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';
import 'package:protofy/features/order_pickup/domain/usecases/get_salad_list_data.dart';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'salad_list_event.dart';
part 'salad_list_state.dart';

// Setting messages for each failure type
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

// Business logic of the app goes here in the bloc
class SaladListBloc extends Bloc<SaladListEvent, SaladListState> {
  final GetSaladListData getSaladListData;

  SaladListBloc({
    required this.getSaladListData,
  }) : super(SaladListStateInitial()) {
    on<LoadSaladList>((event, emit) async {
      debugPrint('Event Called');
      emit(SaladListStateLoading());
      final failureOrSaladList = await getSaladListData(NoParams());
      await failureOrSaladList.fold((failure) async {
        emit(SaladListStateError(message: _mapFailureToMessage(failure)));
      }, (saladList) async {
        emit(SaladListStateLoaded(saladList: saladList));
      });
    });
  }

  // Mapping each of the failures to a message
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
