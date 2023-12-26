import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';

class HttpServiceGoogle {

  static Future<http.Response> getRequest(String endpoint) async {
    final url = Uri.parse(baseUrl + endpoint);

    try {
      final response = await http.get(url);

      final dynamic jsonResponse = json.decode(response.body);
      final prettyJson = const JsonEncoder.withIndent('  ').convert(jsonResponse);

      if (kDebugMode) {
        print('Status Code: ${response.statusCode}');
        print('Headers: ${response.headers}');
        print('Response Body: $prettyJson');
      }

      return response;
    } catch (e) {
      throw Exception('Failed to perform GET request: $e');
    }
  }
}