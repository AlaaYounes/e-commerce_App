import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/repository/authentication/dataSource/auth_remote_dataSource_impl.dart';
import 'package:e_commerce/data/repository/authentication/repository/auth_repository_impl.dart';
import 'package:e_commerce/domain/repository/authentication/auth_remote_dataSource.dart';
import 'package:e_commerce/domain/repository/authentication/auth_repository_contract.dart';
import 'package:e_commerce/domain/useCase/authentication/login_useCase.dart';
import 'package:e_commerce/domain/useCase/authentication/register_useCase.dart';

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectAuthRepositoryContract());
}
