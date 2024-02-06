import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
class ApiHelper {
  final client = http.Client();
  Future<http.Response?> postData(
      {required String url, required Map<String, dynamic> body}) async {
    try {
      var response = await client.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      return response;
    } on SocketException {
      throw 'No internet';
    } on FormatException {
      throw 'Format error';
    }
  }

  Future<http.Response?> getData(
      {required String url}) async {
    try {
      var response = await client.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      return response;
    } on SocketException {
      throw 'No internet';
    } on FormatException {
      throw 'Format error';
    }
  }
}
