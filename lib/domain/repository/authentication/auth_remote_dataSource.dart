import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/entities/authentication/LoginResponseEntity.dart';
import 'package:e_commerce/domain/entities/authentication/RegisterResponseEntity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<BaseError, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<BaseError, LoginResponseEntity>> login(
      String email, String password);
}
