import 'package:http/http.dart';

abstract class FakeServer {
  auth(String orderId);
}

class FakeServerImpl implements FakeServer {
  auth(String orderId) async {
    // Server delay to process the request
    await Future.delayed(Duration(seconds: 3));

    if (orderId == 'benyamin_jafari_2000') {
      return Response(
          '{ "order_id": "benyamin_jafari_2000", "dishes": [ 0, 2, 6 ] }', 200);
    } else {
      return Response('{}', 404);
    }
  }
}
