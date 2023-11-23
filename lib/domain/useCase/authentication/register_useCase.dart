import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/repository/authentication/auth_repository_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract;

  RegisterUseCase({required this.repositoryContract});

  Future<RegisterResponseEntity> invoke(String name, String email,
      String password, String rePassword, String phone) {
    return repositoryContract.register(
        name, email, password, rePassword, phone);
  }
}
