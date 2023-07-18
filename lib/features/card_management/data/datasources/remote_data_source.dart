import 'dart:convert';

import 'package:clean_architecture_tdd_course/core/error/exceptions.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/datasources/fake_server.dart';
import 'package:clean_architecture_tdd_course/features/card_management/data/models/user_data_model.dart';

abstract class RemoteDataSource {
  /// Call the Api endpoint
  /// Throw exception [ServerException] for all error codes
  Future<UserDataModel> getAuthToken(String email, String password);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();
  @override
  Future<UserDataModel> getAuthToken(String email, String password) =>
      _authRequest('http://sampleApi.com/', email, password);

  Future<UserDataModel> _authRequest(
      String url, String email, String password) async {
    final fakeServer = FakeServerImpl();
    final response = await fakeServer.auth(email, password);

    if (response.statusCode == 200) {
      return UserDataModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
