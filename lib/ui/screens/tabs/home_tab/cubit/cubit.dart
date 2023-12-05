import 'package:e_commerce/domain/entities/category/CategoryResponseEntity.dart';
import 'package:e_commerce/domain/useCase/category/get_brands_useCase.dart';
import 'package:e_commerce/domain/useCase/category/get_category_useCase.dart';
import 'package:e_commerce/domain/useCase/category/get_subCategory_useCase.dart';
import 'package:e_commerce/ui/screens/tabs/home_tab/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabCubit extends Cubit<HomeTabStates> {
  GetCategoryUseCase? getCategoryUseCase;
  GetSubCategoryUseCase? getSubCategoryUseCase;
  GetBrandsUseCase? getBrandsUseCase;

  HomeTabCubit({
    this.getCategoryUseCase,
    this.getSubCategoryUseCase,
  }) : super(HomeTabLoadingState());
  List<CategoryEntity> categoriesList = [];
  List<CategoryEntity> subCategoriesList = [];
  List<CategoryEntity> brandsList = [];

  void getCategory() async {
    var either = await getCategoryUseCase?.invoke();
    return either!.fold((l) {
      emit(HomeTabErrorState(errorMessage: l.errorMessage!));
    }, (response) {
      categoriesList = response.data ?? [];
      emit(HomeTabSuccessState());
    });
  }

  void getSubCategory(String categoryId) async {
    var either = await getSubCategoryUseCase?.invoke(categoryId);
    return either!.fold((l) {
      emit(HomeTabErrorState(errorMessage: l.errorMessage!));
    }, (response) {
      subCategoriesList = response.data ?? [];
      emit(HomeTabSuccessState());
    });
  }

  void getBrands() async {
    var either = await getBrandsUseCase?.invoke();
    return either!.fold((l) {
      emit(HomeTabErrorState(errorMessage: l.errorMessage!));
    }, (response) {
      brandsList = response.data ?? [];
      emit(HomeTabSuccessState());
    });
  }

  int selectedIndex = 0;

  void getIndex(int index) {
    selectedIndex = index;
    emit(HomeTabGetIndexState());
  }
}
