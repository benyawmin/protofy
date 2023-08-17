import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:protofy/core/error/exceptions.dart';

class ApiProvider {
  final baseUrl = 'api.stadtsalat.de';

  getOrderDataFromApi() async {
    final uri = Uri.https(baseUrl, '/shop/grosse-theaterstrasse-store');

    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      return items['products'];
    } else {
      throw ServerException();
    }
  }
}
