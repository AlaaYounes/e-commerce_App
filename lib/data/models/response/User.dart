import 'package:e_commerce/domain/entities/UserEntity.dart';

class UserDto extends UserEntity {
  UserDto({
    super.name,
    super.email,
    super.role,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
