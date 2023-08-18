import 'package:protofy/core/error/exceptions.dart';
import 'package:protofy/features/order_pickup/data/datasources/api_provider.dart';
import 'package:protofy/features/order_pickup/data/models/stadt_salat_model.dart';

abstract class RemoteDataSource {
  /// Call the Api endpoint
  /// Throw exception [ServerException] for all error codes
  Future<StadtSalatModel> getSaladData();
}

/// Call the server to get the [StadtSalatModel]
class RemoteDataSourceImpl implements RemoteDataSource {
  ApiProvider apiProvider;
  RemoteDataSourceImpl({required this.apiProvider});
  @override
  // Calling the API with the api address and sending the orderID
  Future<StadtSalatModel> getSaladData() => _saladListDataApiRequest();

  Future<StadtSalatModel> _saladListDataApiRequest() async {
    
    final saladList = await apiProvider.getSaladData();
    return StadtSalatModel.fromJson(saladList);
  }
}
