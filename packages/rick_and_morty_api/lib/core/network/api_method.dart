import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

class ApiMethod {
  static Future<Map<String, dynamic>> get({
    required Dio dio,
    required String uri,
  }) async {
    try {
      final response = await dio.get<String>(uri);
      switch (response.statusCode) {
        case 200:
          final body = json.decode(response.data!);
          return body as Map<String, dynamic>;
        case 500:
        default:
          throw RequestException();
      }
    } on SocketException {
      throw const SocketException('');
    }
  }
}
