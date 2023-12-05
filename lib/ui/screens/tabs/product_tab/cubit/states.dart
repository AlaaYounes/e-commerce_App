import 'package:e_commerce/domain/entities/products/ProductResponseEntity.dart';

abstract class ProductTabStates {}

class ProductLoadingState extends ProductTabStates {}

class ProductErrorState extends ProductTabStates {
  String errorMessage;

  ProductErrorState({required this.errorMessage});
}

class ProductSuccessState extends ProductTabStates {
  List<ProductEntity> productsList;

  ProductSuccessState({required this.productsList});
}
