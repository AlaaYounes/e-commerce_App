import 'package:e_commerce/domain/entities/category/CategoryResponseEntity.dart';
import 'package:e_commerce/domain/injection.dart';
import 'package:e_commerce/ui/screens/tabs/home_tab/cubit/cubit.dart';
import 'package:e_commerce/ui/screens/tabs/home_tab/cubit/states.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryContainer extends StatelessWidget {
  CategoryEntity category;

  SubCategoryContainer({required this.category});

  HomeTabCubit viewModel =
      HomeTabCubit(getSubCategoryUseCase: injectGetSubCategoryUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabStates>(
      bloc: viewModel..getSubCategory(category.id!),
      builder: (context, state) => viewModel.subCategoriesList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  category.name!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: context.h(10),
                ),
                Image.asset(
                  'assets/images/announcement4.png',
                  height: context.h(94),
                  width: context.w(237),
                ),
                SizedBox(
                  height: context.h(10),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Container(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child:
                                    viewModel.subCategoriesList[index].image ==
                                            null
                                        ? Icon(Icons.error)
                                        : Image.network(
                                            viewModel.subCategoriesList[index]
                                                .image!,
                                            height: context.h(70),
                                            width: context.w(70),
                                          ),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              viewModel.subCategoriesList[index].name!,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: viewModel.subCategoriesList.length,
                  ),
                ),
              ],
            ),
    );
  }
}
