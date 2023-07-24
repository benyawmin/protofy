import 'package:http/http.dart';

abstract class FakeServer {
  getOrderDataFromApi(String orderId);
}

class FakeServerImpl implements FakeServer {
  @override
  getOrderDataFromApi(String orderId) async {
    // Server fake delay to process the request
    await Future.delayed(const Duration(seconds: 3));

    if (orderId == 'stany_ibraham_2000') {
      return Response(
          '{ "order_id": "stany_ibraham_2000", "dishes": [ 9, 2, 6 ] }', 200);
    } else {
      return Response('{}', 404);
    }
  }
}