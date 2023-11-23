import 'dart:convert';

import 'package:e_commerce/data/api/api_constants.dart';
import 'package:e_commerce/data/models/request/LoginRequest.dart';
import 'package:e_commerce/data/models/request/RegisterRequest.dart';
import 'package:e_commerce/data/models/response/LoginResponseDto.dart';
import 'package:e_commerce/data/models/response/RegisterResponseDto.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static getInstance() {
    _instance ??= ApiManager._();
    return _instance;
  }

  Future<RegisterResponseDto> register(String name, String email,
      String password, String rePassword, String phone) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.registerApi,
    );
    var requestBody = RegisterRequest(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
    var response = await http.post(url, body: requestBody.toJson());
    return RegisterResponseDto.fromJson(jsonDecode(response.body));
  }

  Future<LoginResponseDto> login(String email, String password) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.loginApi,
    );
    var requestBody = LoginRequest(
      email: email,
      password: password,
    );
    var response = await http.post(url, body: requestBody.toJson());
    return LoginResponseDto.fromJson(jsonDecode(response.body));
  }
}
