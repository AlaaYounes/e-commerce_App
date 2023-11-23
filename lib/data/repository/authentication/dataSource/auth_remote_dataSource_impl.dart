import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/repository/authentication/auth_remote_dataSource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<RegisterResponseEntity> register(String name, String email,
      String password, String rePassword, String phone) {
    return apiManager.register(name, email, password, rePassword, phone);
  }

  @override
  Future<LoginResponseEntity> login(String email, String password) {
    return apiManager.login(email, password);
  }
}
