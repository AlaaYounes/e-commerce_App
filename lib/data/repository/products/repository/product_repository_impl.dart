import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/entities/products/ProductResponseEntity.dart';

import '../../../../domain/repository/products/product_remote_dataSource.dart';
import '../../../../domain/repository/products/product_repository_contract.dart';

class ProductRepositoryImpl implements ProductRepositoryContract {
  ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<BaseError, ProductResponseEntity>> getAllProductsByCategoryId(
      String categoryId) {
    // TODO: implement getAllProducts
    return remoteDataSource.getAllProductsByCategoryId(categoryId);
  }

  @override
  Future<Either<BaseError, ProductResponseEntity>> getAllProducts() {
    return remoteDataSource.getAllProducts();
  }
}
