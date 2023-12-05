import 'package:e_commerce/domain/entities/products/ProductResponseEntity.dart';
import 'package:e_commerce/utils/assets/colors.dart';
import 'package:e_commerce/utils/assets/images.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  ProductEntity product;

  ProductWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.w(291),
          height: context.h(300),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.primaryColor.withOpacity(.3),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Image.network(
                  product.imageCover!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.title!,
                style: Theme.of(context).textTheme.labelSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${product.price} EGP',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reviews (${product.ratingsAverage})',
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 10, top: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: ImageIcon(
              AssetImage(AppImages.favouriteIcon),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 10),
          child: Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.primaryColor,
                ),
                child: Icon(
                  Icons.add,
                  color: AppColor.whiteColor,
                  size: 25,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
