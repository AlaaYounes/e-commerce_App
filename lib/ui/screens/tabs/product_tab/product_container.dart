import 'package:e_commerce/domain/injection.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/cubit/cubit.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/cubit/states.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/product_widget.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductContainer extends StatelessWidget {
  String categoryId;

  ProductContainer({required this.categoryId});

  ProductTabCubit viewModel = ProductTabCubit(
      getAllProductsByCategoryIdUseCase:
          injectGetAllProductsByCategoryIdUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabCubit, ProductTabStates>(
        bloc: viewModel..getAllProductsByCategoryId(categoryId),
        builder: (context, states) {
          return Scaffold(
            appBar: AppBar(),
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
                      itemBuilder: (context, index) =>
                          ProductWidget(product: viewModel.productsList[index]),
                      itemCount: viewModel.productsList.length,
                    ),
                  ),
          );
        });
  }
}
