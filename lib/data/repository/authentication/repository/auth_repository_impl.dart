import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/repository/authentication/auth_remote_dataSource.dart';
import 'package:e_commerce/domain/repository/authentication/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<RegisterResponseEntity> register(String name, String email,
      String password, String rePassword, String phone) {
    return remoteDataSource.register(name, email, password, rePassword, phone);
  }

  @override
  Future<LoginResponseEntity> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
}