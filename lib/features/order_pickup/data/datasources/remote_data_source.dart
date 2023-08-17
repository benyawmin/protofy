import 'package:protofy/core/error/exceptions.dart';
import 'package:protofy/features/order_pickup/data/datasources/api_provider.dart';

abstract class RemoteDataSource {
  /// Call the Api endpoint
  /// Throw exception [ServerException] for all error codes
  Future<List> getOrderData();
}

/// Call the server to get the [StadtSalatModel]
class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();
  @override
  // Calling the API with the api address and sending the orderID
  Future<List> getOrderData() => _orderDataApiRequest();

  Future<List> _orderDataApiRequest() async {
    final apiProvider = ApiProvider();
    final saladList = await apiProvider.getOrderDataFromApi();

    return saladList;
  }
}
