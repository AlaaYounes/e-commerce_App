import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/repository/authentication/auth_repository_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract;

  RegisterUseCase({required this.repositoryContract});

  Future<Either<BaseError, RegisterResponseEntity>> invoke(String name,
      String email, String password, String rePassword, String phone) async {
    var either = await repositoryContract.register(
        name, email, password, rePassword, phone);
    return either.fold(
      (l) => Left(
        BaseError(errorMessage: l.errorMessage),
      ),
      (r) => Right(
        r,
      ),
    );
  }
}
