import 'package:e_commerce/domain/injection.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/cubit/cubit.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/cubit/states.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/product/product_details.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/product/product_widget.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductContainer extends StatelessWidget {
  String categoryId;
  String categoryTitle;

  ProductContainer({required this.categoryId, required this.categoryTitle});

  ProductTabCubit viewModel = ProductTabCubit(
      getAllProductsByCategoryIdUseCase:
          injectGetAllProductsByCategoryIdUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabCubit, ProductTabStates>(
        bloc: viewModel..getAllProductsByCategoryId(categoryId),
        builder: (context, states) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                categoryTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              centerTitle: true,
            ),
            body: viewModel.productsList.isEmpty
                ? Center(
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.w(16),
                    ),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: context.w(2.5),
                          crossAxisSpacing: context.h(2.5)),
                      itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                  product: viewModel.productsList[index],
                                ),
                              ),
                            );
                          },
                          child: ProductWidget(
                              product: viewModel.productsList[index])),
                      itemCount: viewModel.productsList.length,
                    ),
                  ),
          );
        });
  }
}
