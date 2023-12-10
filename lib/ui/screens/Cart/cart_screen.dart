import 'package:e_commerce/ui/screens/Cart/cart_item.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => const CartItem(),
          separatorBuilder: (context, index) => SizedBox(height: context.h(10)),
          itemCount: 10),
    );
  }
}
