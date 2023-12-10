import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/entities/products/ProductDetailsEntity.dart';

import '../../repository/products/product_repository_contract.dart';

class GetProductByIdUseCase {
  ProductRepositoryContract repositoryContract;

  GetProductByIdUseCase({required this.repositoryContract});

  Future<Either<BaseError, ProductDetailsEntity>> invoke(String id) {
    return repositoryContract.getProductById(id);
  }
}
