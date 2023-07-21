import 'dart:convert';

import 'package:Goodbytz/core/error/exceptions.dart';
import 'package:Goodbytz/features/card_management/data/models/order_data_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalDataSource {
  /// Gets cached [OrderDataModel] which was gotten the last time
  /// user had an internet connection
  ///
  /// Throws [NoLocalDataException] if no cached data is present
  Future<OrderDataModel> getCredentials();
  Future<void> cacheCards(OrderDataModel tokenToCache);
}

const CACHED_USER_DATA = 'CACHED_USER_DATA';

class LocalDataSourceImpl implements LocalDataSource {
  final FlutterSecureStorage secureStorage;

  LocalDataSourceImpl({required this.secureStorage});

  @override
  Future<OrderDataModel> getCredentials() async {
    final jsonString = await secureStorage.read(key: CACHED_USER_DATA);

    if (jsonString != null) {
      return Future.value(OrderDataModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCards(OrderDataModel credentialsToCache) {
    return secureStorage.write(
        key: CACHED_USER_DATA, value: json.encode(credentialsToCache.toJson()));
  }
}
