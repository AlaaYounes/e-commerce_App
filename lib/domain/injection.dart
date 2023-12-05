import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/repository/authentication/dataSource/auth_remote_dataSource_impl.dart';
import 'package:e_commerce/data/repository/authentication/repository/auth_repository_impl.dart';
import 'package:e_commerce/data/repository/categories/dataSource/category_remote_dataSource_impl.dart';
import 'package:e_commerce/data/repository/categories/repository/category_repository_impl.dart';
import 'package:e_commerce/data/repository/products/dataSource/product_remote_dataSource_impl.dart';
import 'package:e_commerce/data/repository/products/repository/product_repository_impl.dart';
import 'package:e_commerce/domain/repository/authentication/auth_remote_dataSource.dart';
import 'package:e_commerce/domain/repository/authentication/auth_repository_contract.dart';
import 'package:e_commerce/domain/repository/category/category_remote_dataSource.dart';
import 'package:e_commerce/domain/repository/category/category_repository_contract.dart';
import 'package:e_commerce/domain/repository/products/product_remote_dataSource.dart';
import 'package:e_commerce/domain/repository/products/product_repository_contract.dart';
import 'package:e_commerce/domain/useCase/authentication/login_useCase.dart';
import 'package:e_commerce/domain/useCase/authentication/register_useCase.dart';
import 'package:e_commerce/domain/useCase/category/get_brands_useCase.dart';
import 'package:e_commerce/domain/useCase/category/get_category_useCase.dart';
import 'package:e_commerce/domain/useCase/category/get_subCategory_useCase.dart';
import 'package:e_commerce/domain/useCase/products/get_all_products_by_categoryId.dart';
import 'package:e_commerce/domain/useCase/products/get_all_products_useCase.dart';

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

CategoryRepositoryContract injectCategoryRepositoryContract() {
  return CategoryRepositoryImpl(
      remoteDataSource: injectCategoryRemoteDataSource());
}

CategoryRemoteDataSource injectCategoryRemoteDataSource() {
  return CategoryRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

GetCategoryUseCase injectGetCategoryUseCase() {
  return GetCategoryUseCase(
      repositoryContract: injectCategoryRepositoryContract());
}

GetSubCategoryUseCase injectGetSubCategoryUseCase() {
  return GetSubCategoryUseCase(
      repositoryContract: injectCategoryRepositoryContract());
}

GetBrandsUseCase injectGetBrandsUseCase() {
  return GetBrandsUseCase(
      repositoryContract: injectCategoryRepositoryContract());
}

ProductRepositoryContract injectProductRepositoryContract() {
  return ProductRepositoryImpl(
      remoteDataSource: injectProductRemoteDataSource());
}

ProductRemoteDataSource injectProductRemoteDataSource() {
  return ProductRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

GetAllProductsUseCase injectGetAllProductsUseCase() {
  return GetAllProductsUseCase(
      repositoryContract: injectProductRepositoryContract());
}

GetAllProductsByCategoryIdUseCase injectGetAllProductsByCategoryIdUseCase() {
  return GetAllProductsByCategoryIdUseCase(
      repositoryContract: injectProductRepositoryContract());
}
