import 'package:e_commerce/data/models/response/User.dart';

class LoginResponseEntity {
  LoginResponseEntity({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
  });

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
}
