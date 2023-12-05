import 'package:e_commerce/ui/screens/tabs/favourite_tab/product_fav_item.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => const ProductFavItem(),
        separatorBuilder: (context, index) => SizedBox(height: context.h(10)),
        itemCount: 10);
  }
}
