import 'package:http/http.dart';

abstract class FakeServer {
  getOrderDataFromApi(String orderId);
}

class FakeServerImpl implements FakeServer {
  @override
  getOrderDataFromApi(String orderId) async {
    // Server fake delay to process the request
    await Future.delayed(const Duration(seconds: 5));

    // If order id is correct the server returns the [order_id] and the number
    // of the boxes in which the user's dishes are present.
    if (orderId == 'haritha_kumar_2000') {
      return Response(
          '{ "order_id": "haritha_kumar_2000", "dishes": [ 0, 2, 6 ] }', 200);
    } else {
      return Response('{}', 404);
    }
  }
}
