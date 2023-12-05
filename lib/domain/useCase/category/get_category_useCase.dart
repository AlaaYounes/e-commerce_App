import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
import 'package:e_commerce/domain/entities/category/CategoryResponseEntity.dart';
import 'package:e_commerce/domain/repository/category/category_repository_contract.dart';

class GetCategoryUseCase {
  CategoryRepositoryContract repositoryContract;

  GetCategoryUseCase({required this.repositoryContract});

  Future<Either<BaseError, CategoryResponseEntity>> invoke() {
    return repositoryContract.getCategory();
  }
}
