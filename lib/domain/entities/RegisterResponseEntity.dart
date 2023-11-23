import 'package:e_commerce/data/models/response/Errors.dart';
import 'package:e_commerce/data/models/response/User.dart';

class RegisterResponseEntity {
  RegisterResponseEntity({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
    this.errors,
  });

  String? message;
  User? user;
  String? token;
  String? statusMsg;
  Errors? errors;
}
