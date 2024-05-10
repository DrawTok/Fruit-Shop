import 'dart:convert';

import 'package:http/http.dart' as http;

class THttpPayment {
  static const String _domainMoMo = 'https://test-payment.momo.vn';

  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_domainMoMo/$endpoint'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> _handleResponse(
      http.Response response) async {
    Map<String, dynamic> decodedResponse = json.decode(response.body);
    return decodedResponse;
  }
}
