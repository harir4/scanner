import 'dart:convert';

import 'package:scanner/utils/constants/apiconstant.dart';
import 'package:scanner/utils/errors/errors.dart';
import 'package:scanner/utils/helper/apihelper.dart';

class ApiServices {
  final _apiHelper = ApiHelper();
  Future<void> register({
    required String name,
    required String rollno,
    required String email,
    required String password,
  }) async {
    var response = await _apiHelper.postData(
      url: Apiconstant.baseUrl + Apiconstant.registerUrl,
      body: {
        "name": name,
        "email": email,
        "password": password,
        "rollno": rollno
      },
    );

    if (response!.statusCode == 200) {
      print('success');
    } else {
      print(response.statusCode);

      throw NetworkError.networkError(response.statusCode);
    }
  }

  Future<String> login(
      {required String rollno, required String password}) async {
    var response = await _apiHelper.postData(
      url: Apiconstant.baseUrl + Apiconstant.loginurl,
      body: {
        "rollno": rollno,
        "password": password,
      },
    );

    var data = jsonDecode(response!.body);
    if (response.statusCode == 200) {
      return data['rollno'];
    } else {
      throw NetworkError.networkError(response.statusCode);
    }
  }

  //get data

  Future<Map<String, dynamic>> profile(
      {required String rollno}) async {
    var response = await _apiHelper.getData(
      url: Apiconstant.baseUrl + Apiconstant.profileUrl + rollno,
    );

    var data = jsonDecode(response!.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      throw NetworkError.networkError(response.statusCode);
    }
  }
}
