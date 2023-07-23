import 'dart:convert';

import 'package:Goodbytz/core/error/exceptions.dart';
import 'package:Goodbytz/features/order_pickup/data/datasources/fake_server.dart';
import 'package:Goodbytz/features/order_pickup/data/models/order_data_model.dart';

abstract class RemoteDataSource {
  /// Call the Api endpoint
  /// Throw exception [ServerException] for all error codes
  Future<OrderDataModel> getOrderData(String orderId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();
  @override
  Future<OrderDataModel> getOrderData(String orderId) =>
      _orderDataApiRequest('http://sampleApi.com/', orderId);

  Future<OrderDataModel> _orderDataApiRequest(
      String url, String orderId) async {
    final fakeServer = FakeServerImpl();
    final response = await fakeServer.getOrderDataFromApi(orderId);

    if (response.statusCode == 200) {
      return OrderDataModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
