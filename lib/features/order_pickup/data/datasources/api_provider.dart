import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:protofy/core/error/exceptions.dart';

class ApiProvider {
  final baseUrl = 'api.stadtsalat.de';
  http.Client client = http.Client();
  getSaladData() async {
    final uri = Uri.https(baseUrl, '/shop/grosse-theaterstrasse-store');
    http.Response response = await client.get(uri);
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      return items;
    } else {
      throw ServerException();
    }
  }
}
