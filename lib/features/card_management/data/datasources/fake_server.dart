import 'package:http/http.dart';

abstract class FakeServer {
  auth(String username, String password);
}

class FakeServerImpl implements FakeServer {
  auth(String username, String password) async {
    // Server delay to process the request
    await Future.delayed(Duration(seconds: 1));

    if (username == 'benyamin@email.com' &&
        password == 'pasd3q21esE#QD123ewdasDA') {
      return Response(
          '{ "token": "REQUESTED_TOKEN", "cards" : [ { "name": "Julia Adams", "email": "Julia@email.com", "phoneNumber": "+49 761 123 4567", "ibanNumber": "DE89 3704 0044 0532 0130 00" }, { "name": "John Adams", "email": "John@email.com", "phoneNumber": "+49 721 123 4567", "ibanNumber": "DE39 3704 0044 0532 0330 00" }, { "name": "Fred Evans", "email": "fred@email.com", "phoneNumber": "+49 725 123 4567", "ibanNumber": "DE39 3702 0044 0532 0134 00" }, { "name": "Jason Muster", "email": "jason@email.com", "phoneNumber": "+49 761 123 4587", "ibanNumber": "DE89 3704 0084 0532 0130 00" } ] }',
          200);
    } else {
      return Response('{}', 404);
    }
  }
}
