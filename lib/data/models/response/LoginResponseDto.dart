import 'package:e_commerce/data/models/response/User.dart';
import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({
    super.message,
    super.user,
    super.token,
  });

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}
