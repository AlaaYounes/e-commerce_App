import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/entities/category/CategoryResponseEntity.dart';
import 'package:e_commerce/domain/repository/category/category_remote_dataSource.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  ApiManager apiManager;

  CategoryRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<BaseError, CategoryResponseEntity>> getCategory() {
    return apiManager.getCategory();
  }

  @override
  Future<Either<BaseError, CategoryResponseEntity>> getBrands() {
    return apiManager.getCategory();
  }

  @override
  Future<Either<BaseError, CategoryResponseEntity>> getSubCategory(
      String categoryId) {
    return apiManager.getSubCategory(categoryId);
  }
}
