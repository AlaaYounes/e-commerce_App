import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/entities/products/ProductResponseEntity.dart';

abstract class ProductRepositoryContract {
  Future<Either<BaseError, ProductResponseEntity>> getAllProductsByCategoryId(
      String categoryId);

  Future<Either<BaseError, ProductResponseEntity>> getAllProducts();
}
