import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/entities/products/ProductResponseEntity.dart';

import '../../../../domain/repository/products/product_remote_dataSource.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ApiManager apiManager;

  ProductRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<BaseError, ProductResponseEntity>> getAllProductsByCategoryId(
      String categoryId) {
    return apiManager.getAllProductsByCategoryId(categoryId);
  }

  @override
  Future<Either<BaseError, ProductResponseEntity>> getAllProducts() {
    return apiManager.getAllProducts();
  }
}
