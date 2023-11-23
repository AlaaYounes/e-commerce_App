import 'package:e_commerce/data/models/response/Errors.dart';
import 'package:e_commerce/data/models/response/User.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto({
    super.message,
    super.user,
    super.token,
    super.statusMsg,
    super.errors,
  });

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['errors'] = errors?.toJson();
    map['token'] = token;
    return map;
  }
}
