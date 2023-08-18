import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:protofy/core/error/failures.dart';
import 'package:protofy/core/usecases/usecase.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';
import 'package:protofy/features/order_pickup/domain/repositories/salad_repository.dart';
import 'package:protofy/features/order_pickup/domain/usecases/get_salad_list_data.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'get_salad_list_data.mocks.dart';

@GenerateMocks([SaladRepository])
void main() {
  late GetSaladListData usecase;
  late MockSaladRepository mockRepository;

  setUp(() {
    mockRepository = MockSaladRepository();
    usecase = GetSaladListData(mockRepository);
  });

  final tStadtSalatModel = StadtSalatModel(
      products: StadtSalatModel.fromJson(json.decode(fixture('sample_map.json')))
          .products /* Initialize with your test data */);

  test(
    'should get salad list data from the repository',
    () async {
      // Arrange
      when(mockRepository.getSaladListOfData())
          .thenAnswer((_) async => Right(tStadtSalatModel));

      // Act
      final result = await usecase(NoParams());

      // Assert
      expect(result, Right(tStadtSalatModel));
      verify(mockRepository.getSaladListOfData());
      verifyNoMoreInteractions(mockRepository);
    },
  );

  test(
    'should return a failure when getting salad list data fails',
    () async {
      // Arrange
      when(mockRepository.getSaladListOfData())
          .thenAnswer((_) async => Left(ServerFailure()));

      // Act
      final result = await usecase(NoParams());

      // Assert
      expect(result, Left(ServerFailure()));
      verify(mockRepository.getSaladListOfData());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
