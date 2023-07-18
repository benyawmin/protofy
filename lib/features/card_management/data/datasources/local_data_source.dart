import 'dart:convert';

import 'package:Enter/core/error/exceptions.dart';
import 'package:Enter/features/card_management/data/models/user_data_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalDataSource {
  /// Gets cached [UserDataModel] which was gotten the last time
  /// user had an internet connection
  ///
  /// Throws [NoLocalDataException] if no cached data is present
  Future<UserDataModel> getCredentials();
  Future<void> cacheCards(UserDataModel tokenToCache);
}

const CACHED_USER_DATA = 'CACHED_USER_DATA';

class LocalDataSourceImpl implements LocalDataSource {
  final FlutterSecureStorage secureStorage;

  LocalDataSourceImpl({required this.secureStorage});

  @override
  Future<UserDataModel> getCredentials() async {
    final jsonString = await secureStorage.read(key: CACHED_USER_DATA);

    if (jsonString != null) {
      return Future.value(UserDataModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCards(UserDataModel credentialsToCache) {
    return secureStorage.write(
        key: CACHED_USER_DATA, value: json.encode(credentialsToCache.toJson()));
  }
}
