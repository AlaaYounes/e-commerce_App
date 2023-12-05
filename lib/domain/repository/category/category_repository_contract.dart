import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/entities/category/CategoryResponseEntity.dart';

abstract class CategoryRepositoryContract {
  Future<Either<BaseError, CategoryResponseEntity>> getCategory();

  Future<Either<BaseError, CategoryResponseEntity>> getBrands();

  Future<Either<BaseError, CategoryResponseEntity>> getSubCategory(
      String categoryId);
}
