import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce/domain/repository/authentication/auth_repository_contract.dart';

class LoginUseCase {
  AuthRepositoryContract repositoryContract;

  LoginUseCase({required this.repositoryContract});

  Future<LoginResponseEntity> invoke(String email, String password) {
    return repositoryContract.login(email, password);
  }
}
