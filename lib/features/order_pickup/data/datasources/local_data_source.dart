import 'dart:convert';

import 'package:protofy/core/error/exceptions.dart';
import 'package:protofy/features/order_pickup/data/models/order_data_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalDataSource {
  /// Gets cached [StadtSalatModel] which was gotten the last time
  /// user had an internet connection
  ///
  /// Throws [NoLocalDataException] if no cached data is present
  Future<StadtSalatModel> getCachedOrderData();
  Future<void> cacheOrderData(StadtSalatModel orderLocalDataToCache);
}

// ignore: constant_identifier_names
const CACHED_ORDER_DATA = 'CACHED_USER_DATA';

/// We cache the [StadtSalatModel] so if anything went wrong with the server
/// we do not lost the order data.
class LocalDataSourceImpl implements LocalDataSource {
  final FlutterSecureStorage secureStorage;

  LocalDataSourceImpl({required this.secureStorage});

  /// [StadtSalatModel] will be read from the memory
  @override
  Future<StadtSalatModel> getCachedOrderData() async {
    final jsonString = await secureStorage.read(key: CACHED_ORDER_DATA);

    /// If the [OrderDataModel] exist in memory return it otherwise return [CacheException]
    if (jsonString != null) {
      return Future.value(StadtSalatModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  /// [StadtSalatModel] will be cached in memory as a json map
  @override
  Future<void> cacheOrderData(StadtSalatModel orderDataModelToCache) {
    return secureStorage.write(
        key: CACHED_ORDER_DATA,
        value: json.encode(orderDataModelToCache.toJson()));
  }
}
