import 'dart:convert';
import 'dart:developer';
import 'package:fruitshop/models/mapbox/coordinates.dart';
import 'package:http/http.dart' as http;

class THttpHelper {
  static const String _baseUrl =
      'https://project-server-android.onrender.com/api';

  static const String _mapBoxUrl =
      'https://api.mapbox.com/search/geocode/v6/reverse?';

  static Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  static Future<dynamic> getWithToken(String endpoint, String token) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Authorization': 'Bearer $token'});
    return _handleResponseList(response);
  }

  static Future<dynamic> getAll(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
      return _handleResponseList(response);
    } catch (e) {
      log('Error endpoint $endpoint: $e');
      return [];
    }
  }

  static Future<dynamic> post(String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<dynamic> postWithToken(
      String endpoint, dynamic data, String token) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<dynamic> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<dynamic> deleteWithToken(String endpoint, String token) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    return _handleResponse(response);
  }

  static Future<dynamic> _handleResponse(http.Response response) async {
    dynamic decodedResponse = json.decode(response.body);
    return decodedResponse;
  }

  static Future<dynamic> _handleResponseList(http.Response response) {
    List<dynamic> jsonResponse = json.decode(response.body);
    List<Map<String, dynamic>> dataList = jsonResponse.map((item) {
      return Map<String, dynamic>.from(item);
    }).toList();
    return Future.value(dataList);
  }

  static Future<dynamic> getAddress(double lat, double long, String token) async {

    final response = await http.get(
      Uri.parse('$_mapBoxUrl&access_token=$token'
          '&latitude=$lat'
          '&longitude=$long'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return _handleResponse(response);
  }
}
