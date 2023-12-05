import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_constants.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/data/models/request/LoginRequest.dart';
import 'package:e_commerce/data/models/request/RegisterRequest.dart';
import 'package:e_commerce/data/models/response/CategoryResponseDto.dart';
import 'package:e_commerce/data/models/response/LoginResponseDto.dart';
import 'package:e_commerce/data/models/response/ProductResponseDto.dart';
import 'package:e_commerce/data/models/response/RegisterResponseDto.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static getInstance() {
    _instance ??= ApiManager._();
    return _instance;
  }

  Future<Either<BaseError, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
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
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(
          BaseError(
              errorMessage: registerResponse.errors != null
                  ? registerResponse.errors!.msg
                  : registerResponse.message),
        );
      }
    } else {
      return Left(BaseError(errorMessage: 'check internet connection.'));
    }
  }

  Future<Either<BaseError, LoginResponseDto>> login(
      String email, String password) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(
        ApiConstants.baseUrl,
        ApiConstants.loginApi,
      );
      var requestBody = LoginRequest(
        email: email,
        password: password,
      );
      var response = await http.post(url, body: requestBody.toJson());
      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(BaseError(errorMessage: loginResponse.message));
      }
    } else {
      return Left(BaseError(errorMessage: 'check internet connection.'));
    }
  }

  Future<Either<BaseError, CategoryResponseDto>> getCategory() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.categoryApi);
      var responseBody = await http.get(url);
      var response =
          CategoryResponseDto.fromJson(jsonDecode(responseBody.body));
      if (responseBody.statusCode == 200) {
        return Right(response);
      } else {
        return Left(BaseError(errorMessage: 'something went wrong'));
      }
    } else {
      return Left(BaseError(errorMessage: 'check internet connection. '));
    }
  }

  Future<Either<BaseError, CategoryResponseDto>> getSubCategory(
      String categoryId) async {
    String subCategoryApi = '/api/v1/categories/$categoryId/subcategories';
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, subCategoryApi);
      var responseBody = await http.get(url);
      var response =
          CategoryResponseDto.fromJson(jsonDecode(responseBody.body));
      if (responseBody.statusCode == 200) {
        return Right(response);
      } else {
        return Left(BaseError(errorMessage: 'something went wrong'));
      }
    } else {
      return Left(BaseError(errorMessage: 'check internet connection. '));
    }
  }

  Future<Either<BaseError, CategoryResponseDto>> getBrands() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.brandApi);
      var responseBody = await http.get(url);
      var response =
          CategoryResponseDto.fromJson(jsonDecode(responseBody.body));
      if (responseBody.statusCode == 200) {
        return Right(response);
      } else {
        return Left(BaseError(errorMessage: 'something went wrong'));
      }
    } else {
      return Left(BaseError(errorMessage: 'check internet connection. '));
    }
  }

  Future<Either<BaseError, ProductResponseDto>> getAllProductsByCategoryId(
      String categoryId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.allProductsApi, {
        'category[in]': categoryId,
      });
      var responseBody = await http.get(url);
      var response = ProductResponseDto.fromJson(jsonDecode(responseBody.body));
      if (responseBody.statusCode == 200) {
        return Right(response);
      } else {
        return Left(BaseError(errorMessage: 'something went wrong'));
      }
    } else {
      return Left(BaseError(errorMessage: 'check internet connection. '));
    }
  }

  Future<Either<BaseError, ProductResponseDto>> getAllProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.allProductsApi);
      var responseBody = await http.get(url);
      var response = ProductResponseDto.fromJson(jsonDecode(responseBody.body));
      if (responseBody.statusCode == 200) {
        return Right(response);
      } else {
        return Left(BaseError(errorMessage: 'something went wrong'));
      }
    } else {
      return Left(BaseError(errorMessage: 'check internet connection. '));
    }
  }
}
