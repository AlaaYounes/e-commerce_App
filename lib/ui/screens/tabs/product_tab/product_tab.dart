import 'package:e_commerce/domain/injection.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/cubit/cubit.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/cubit/states.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/product/product_details.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/product/product_widget.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTab extends StatelessWidget {
  ProductTabCubit viewModel = ProductTabCubit(
    getAllProductsUseCase: injectGetAllProductsUseCase(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabCubit, ProductTabStates>(
      bloc: viewModel..getAllProducts(),
      builder: (context, states) {
        return viewModel.productsList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
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
                              product: viewModel.productsList[index]),
                        ),
                      );
                    },
                    child:
                        ProductWidget(product: viewModel.productsList[index])),
                itemCount: viewModel.productsList.length,
              );
      },
    );
  }
}
