import 'package:e_commerce/data/models/response/Errors.dart';
import 'package:e_commerce/data/models/response/User.dart';

class RegisterResponseEntity {
  RegisterResponseEntity({
    this.message,
    this.user,
    this.token,
    this.errors,
    this.statusMsg,
  });

  String? message;
  UserDto? user;
  Errors? errors;
  String? token;
  String? statusMsg;
}
