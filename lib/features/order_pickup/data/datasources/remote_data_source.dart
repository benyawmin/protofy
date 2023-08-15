import 'dart:convert';

import 'package:protofy/core/error/exceptions.dart';
import 'package:protofy/features/order_pickup/data/datasources/api_provider.dart';
import 'package:protofy/features/order_pickup/data/models/order_data_model.dart';

abstract class RemoteDataSource {
  /// Call the Api endpoint
  /// Throw exception [ServerException] for all error codes
  Future<StadtSalatModel> getOrderData();
}

/// Call the server to get the [StadtSalatModel]
class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();
  @override
  // Calling the API with the api address and sending the orderID
  Future<StadtSalatModel> getOrderData() => _orderDataApiRequest();

  Future<StadtSalatModel> _orderDataApiRequest() async {
    final fakeServer = ApiProvider();
    final response = await fakeServer.getOrderDataFromApi();

    if (response.statusCode == 200) {
      return StadtSalatModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
