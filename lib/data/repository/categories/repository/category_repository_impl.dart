import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/entities/category/CategoryResponseEntity.dart';
import 'package:e_commerce/domain/repository/category/category_remote_dataSource.dart';
import 'package:e_commerce/domain/repository/category/category_repository_contract.dart';

class CategoryRepositoryImpl implements CategoryRepositoryContract {
  CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<BaseError, CategoryResponseEntity>> getCategory() {
    return remoteDataSource.getCategory();
  }

  @override
  Future<Either<BaseError, CategoryResponseEntity>> getBrands() {
    return remoteDataSource.getCategory();
  }

  @override
  Future<Either<BaseError, CategoryResponseEntity>> getSubCategory(
      String categoryId) {
    return remoteDataSource.getSubCategory(categoryId);
  }
}
