import 'package:e_commerce/ui/screens/tabs/product_tab/category_container.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/subCategory_container.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CategoryContainer(),
        ),
        SizedBox(
          width: context.w(10),
        ),
        Expanded(
          flex: 2,
          child: SubCategoryContainer(),
        ),
      ],
    );
  }
}
