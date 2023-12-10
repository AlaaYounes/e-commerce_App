import 'package:e_commerce/domain/entities/products/ProductResponseEntity.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/cubit/cubit.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/cubit/states.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/product/product_images.dart';
import 'package:e_commerce/utils/assets/colors.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProductDetails extends StatelessWidget {
  ProductEntity product;

  // int totalPrice;
  // int count;
  ProductDetails({
    required this.product,
    // required this.totalPrice,
    // required this.count,
  });

  ProductTabCubit viewModel = ProductTabCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabCubit, ProductTabStates>(
      bloc: viewModel
        ..add(product.price!)
        ..minus(product.price!),
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(
            product.title ?? 'Product details',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
          actions: [
            const Icon(
              Icons.search,
              size: 24,
            ),
            SizedBox(
              width: context.w(10),
            ),
            const Icon(
              Icons.shopping_cart_outlined,
              size: 24,
            ),
            SizedBox(
              width: context.w(5),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageSlideshow(
                initialPage: 0,
                isLoop: true,
                autoPlayInterval: 3000,
                indicatorColor: AppColor.primaryColor,
                children: product.images!
                    .map(
                      (image) => ProductImages(image: image),
                    )
                    .toList(),
              ),
              SizedBox(
                height: context.h(15),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      product.title!,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColor.primaryColor),
                      maxLines: 2,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${product.price!} EGP',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColor.primaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: context.h(10),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        ' ${product.ratingsAverage} (${product.ratingsQuantity})',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: AppColor.primaryColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: context.w(122),
                    height: context.h(42),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(20),
                        right: Radius.circular(20),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            viewModel.minus(product.price!);
                          },
                          child: Icon(
                            Icons.remove_circle_outline_outlined,
                            color: AppColor.whiteColor,
                            size: 25,
                          ),
                        ),
                        Text('${viewModel.count}'),
                        InkWell(
                          onTap: () {
                            viewModel.add(product.price!);
                          },
                          child: Icon(
                            Icons.add_circle_outline_sharp,
                            color: AppColor.whiteColor,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: context.h(10),
              ),
              Text(
                'Description',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColor.primaryColor),
              ),
              SizedBox(
                height: context.h(5),
              ),
              Text(
                product.description!,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColor.primaryColor.withOpacity(0.3),
                    ),
              ),
              const Spacer(),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total price',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColor.primaryColor.withOpacity(0.5),
                                ),
                      ),
                      const SizedBox(
                        height: 2.5,
                      ),
                      Text(
                        '${viewModel.totalPrice} EGP',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: context.w(20),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: context.w(270),
                        height: context.h(48),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_shopping_cart,
                              color: AppColor.whiteColor,
                            ),
                            SizedBox(
                              width: context.w(20),
                            ),
                            Text(
                              'Add to cart',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
