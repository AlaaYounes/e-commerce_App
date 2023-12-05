import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/entities/products/ProductResponseEntity.dart';

import '../../repository/products/product_repository_contract.dart';

class GetAllProductsByCategoryIdUseCase {
  ProductRepositoryContract repositoryContract;

  GetAllProductsByCategoryIdUseCase({required this.repositoryContract});

  Future<Either<BaseError, ProductResponseEntity>> invoke(String categoryId) {
    return repositoryContract.getAllProductsByCategoryId(categoryId);
  }
}
