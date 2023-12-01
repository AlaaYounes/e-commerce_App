import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce/domain/repository/authentication/auth_remote_dataSource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<BaseError, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) {
    return apiManager.register(name, email, password, rePassword, phone);
    // return either.fold((error) {
    //   return Left(BaseError(errorMessage: error.errorMessage));
    // }, (response) {
    //   return Right(RegisterResponseEntity());
    // });
  }

  @override
  Future<Either<BaseError, LoginResponseEntity>> login(
      String email, String password) {
    return apiManager.login(email, password);
    // return  either.fold((error) {
    //   return Left(BaseError(errorMessage: error.errorMessage));
    // }, (response) {
    //   return Right(LoginResponseEntity());
    // });
  }
}
