import 'dart:convert';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:protofy/core/error/failures.dart';
import 'package:protofy/core/usecases/usecase.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';
import 'package:protofy/features/order_pickup/domain/usecases/get_salad_list_data.dart';
import 'package:protofy/features/order_pickup/presentation/bloc/order_input_bloc/salad_list_bloc.dart';
import '../../../../../fixtures/fixture_reader.dart';
import 'login_bloc_test.mocks.dart';

@GenerateMocks([GetSaladListData])
void main() {
  late SaladListBloc bloc;
  late MockGetSaladListData mockGetSaladListData;

  setUp(() {
    mockGetSaladListData = MockGetSaladListData();
    bloc = SaladListBloc(getSaladListData: mockGetSaladListData);
  });

  test('initial state should be SaladListStateInitial', () {
    expect(bloc.state, SaladListStateInitial());
  });

  blocTest<SaladListBloc, SaladListState>(
    'emits [SaladListStateLoading, SaladListStateLoaded] when LoadSaladList event is added',
    build: () {
      when(mockGetSaladListData(NoParams())).thenAnswer((_) async => Right(
          StadtSalatModel(
              products: StadtSalatModel.fromJson(json.decode(fixture('sample_map.json'))).products)));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadSaladList()),
    expect: () => [
      SaladListStateLoading(),
      SaladListStateLoaded(
          saladList: StadtSalatModel(
              products: StadtSalatModel.fromJson(json.decode(fixture('sample_map.json'))).products)),
    ],
  );

  blocTest<SaladListBloc, SaladListState>(
    'emits [SaladListStateLoading, SaladListStateError] when LoadSaladList event results in a failure',
    build: () {
      when(mockGetSaladListData(NoParams()))
          .thenAnswer((_) async => Left(ServerFailure()));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadSaladList()),
    expect: () => [
      SaladListStateLoading(),
      const SaladListStateError(message: SERVER_FAILURE_MESSAGE),
    ],
  );
}
