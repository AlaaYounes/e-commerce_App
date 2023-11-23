import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';

abstract class AuthRepositoryContract {
  Future<RegisterResponseEntity> register(String name, String email,
      String password, String rePassword, String phone);

  Future<LoginResponseEntity> login(String email, String password);
}
