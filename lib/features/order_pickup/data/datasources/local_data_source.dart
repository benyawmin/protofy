import 'dart:convert';

import 'package:Goodbytz/core/error/exceptions.dart';
import 'package:Goodbytz/features/order_pickup/data/models/order_data_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalDataSource {
  /// Gets cached [OrderDataModel] which was gotten the last time
  /// user had an internet connection
  ///
  /// Throws [NoLocalDataException] if no cached data is present
  Future<OrderDataModel> getCachedOrderData();
  Future<void> cacheOrderData(OrderDataModel orderLocalDataToCache);
}

// ignore: constant_identifier_names
const CACHED_ORDER_DATA = 'CACHED_USER_DATA';

/// We cache the [OrderDataModel] so if anything went wrong with the server
/// we do not lost the order data.
class LocalDataSourceImpl implements LocalDataSource {
  final FlutterSecureStorage secureStorage;

  LocalDataSourceImpl({required this.secureStorage});

  /// [OrderDataModel] will be read from the memory
  @override
  Future<OrderDataModel> getCachedOrderData() async {
    final jsonString = await secureStorage.read(key: CACHED_ORDER_DATA);

    /// If the [OrderDataModel] exist in memory return it otherwise return [CacheException]
    if (jsonString != null) {
      return Future.value(OrderDataModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  /// [OrderDataModel] will be cached in memory as a json map
  @override
  Future<void> cacheOrderData(OrderDataModel orderDataModelToCache) {
    return secureStorage.write(
        key: CACHED_ORDER_DATA,
        value: json.encode(orderDataModelToCache.toJson()));
  }
}
