import 'package:e_commerce/domain/entities/category/CategoryResponseEntity.dart';
import 'package:e_commerce/domain/entities/products/ProductResponseEntity.dart';
import 'package:e_commerce/domain/useCase/products/get_all_products_by_categoryId.dart';
import 'package:e_commerce/domain/useCase/products/get_all_products_useCase.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTabCubit extends Cubit<ProductTabStates> {
  GetAllProductsUseCase? getAllProductsUseCase;
  GetAllProductsByCategoryIdUseCase? getAllProductsByCategoryIdUseCase;

  ProductTabCubit({
    this.getAllProductsUseCase,
    this.getAllProductsByCategoryIdUseCase,
  }) : super(ProductLoadingState());
  List<ProductEntity> productsList = [];
  List<CategoryEntity> subCategoriesList = [];

  void getAllProducts() async {
    var either = await getAllProductsUseCase!.invoke();
    either.fold((l) {
      emit(ProductErrorState(errorMessage: l.errorMessage!));
    }, (response) {
      productsList = response.data!;
      emit(ProductSuccessState(productsList: response.data!));
    });
  }

  void getAllProductsByCategoryId(String categoryId) async {
    var either = await getAllProductsByCategoryIdUseCase!.invoke(categoryId);
    either.fold((l) {
      emit(ProductErrorState(errorMessage: l.errorMessage!));
    }, (response) {
      productsList = response.data!;
      emit(ProductSuccessState(productsList: response.data!));
    });
  }
}
