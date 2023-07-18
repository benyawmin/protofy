import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_tdd_course/core/error/exceptions.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/datasources/remote_data_source.dart';

void main() {
  late RemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = RemoteDataSourceImpl();
  });

  group('getAuthToken', () {
    test('should return a UserAuthModel when email and password are correct',
        () async {
      // Arrange
      final correctEmail = 'benyamin@email.com';
      final correctPassword = 'pasd3q21esE#QD123ewdasDA';
      final expectedToken = 'REQUESTED_TOKEN';

      // Act
      final result =
          await remoteDataSource.getAuthToken(correctEmail, correctPassword);

      // Assert
      expect(result, isNotNull);
      expect(result.token, equals(expectedToken));
    });

    test(
        'should throw a ServerException when the server response was unexcpected (for example)',
        () async {
      // Arrange
      final wrongEmail = 'wrongEmail';
      final wrongPassword = 'wrongPassword';

      // Act
      final call = remoteDataSource.getAuthToken(wrongEmail, wrongPassword);

      // Assert
      expect(call, throwsA(isA<ServerException>()));
    });
  });
}
