import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  final baseUrl = 'api.stadtsalat.de';

  getOrderDataFromApi() async {
    final uri = Uri.https(baseUrl, '/shop/grosse-theaterstrasse-store');

    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      return items;
    } else if (response.statusCode == 401) {
      throw Exception('Error 401');
    } else if (response.statusCode == 429) {
      throw Exception('Error 429');
    } else {
      throw Exception('Unknown problem');
    }
  }
}
