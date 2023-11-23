import 'package:e_commerce/data/models/response/User.dart';

class LoginResponseEntity {
  LoginResponseEntity({
    this.message,
    this.user,
    this.token,
  });

  String? message;
  User? user;
  String? token;
}
