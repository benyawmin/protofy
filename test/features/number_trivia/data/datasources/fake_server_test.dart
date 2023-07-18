import 'package:Enter/features/card_management/data/datasources/fake_server.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FakeServerImpl', () {
    late FakeServerImpl apiFakeServer;

    setUp(() {
      apiFakeServer = FakeServerImpl();
    });

    test(
        'Should return the authentication token for the correct email and password',
        () async {
      // arrange
      final String correctEmail = 'benyamin@email.com';
      final String correctPassword = 'pasd3q21esE#QD123ewdasDA';
      final String serverCorrectResponse =
          '{ "token": "REQUESTED_TOKEN", "cards" : [ { "name": "Julia Adams", "email": "Julia@email.com", "phoneNumber": "+49 761 123 4567", "ibanNumber": "DE89 3704 0044 0532 0130 00" }, { "name": "John Adams", "email": "John@email.com", "phoneNumber": "+49 721 123 4567", "ibanNumber": "DE39 3704 0044 0532 0330 00" }, { "name": "Fred Evans", "email": "fred@email.com", "phoneNumber": "+49 725 123 4567", "ibanNumber": "DE39 3702 0044 0532 0134 00" }, { "name": "Jason Muster", "email": "jason@email.com", "phoneNumber": "+49 761 123 4587", "ibanNumber": "DE89 3704 0084 0532 0130 00" } ] }';
      // act

      final response = await apiFakeServer.auth(
        correctEmail,
        correctPassword,
      );
      // assert
      expect(response.statusCode, 200);
      expect(response.body, serverCorrectResponse);
    });

    test('should return a 404 error for the wrong email and password input',
        () async {
      final response = await apiFakeServer.auth('dsa', '213ed');

      expect(response.statusCode, 404);
      expect(response.body, '{}');
    });
  });
}
