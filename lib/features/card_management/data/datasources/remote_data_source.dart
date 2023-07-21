import 'dart:convert';

import 'package:Goodbytz/core/error/exceptions.dart';
import 'package:Goodbytz/features/card_management/data/datasources/fake_server.dart';
import 'package:Goodbytz/features/card_management/data/models/order_data_model.dart';

abstract class RemoteDataSource {
  /// Call the Api endpoint
  /// Throw exception [ServerException] for all error codes
  Future<OrderDataModel> getAuthToken(String orderId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();
  @override
  Future<OrderDataModel> getAuthToken(String orderId) =>
      _authRequest('http://sampleApi.com/', orderId);

  Future<OrderDataModel> _authRequest(String url, String orderId) async {
    final fakeServer = FakeServerImpl();
    final response = await fakeServer.auth(orderId);

    if (response.statusCode == 200) {
      return OrderDataModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
