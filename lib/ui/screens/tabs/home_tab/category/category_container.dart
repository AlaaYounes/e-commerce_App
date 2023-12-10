import 'package:e_commerce/domain/entities/category/CategoryResponseEntity.dart';
import 'package:e_commerce/utils/assets/colors.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  CategoryEntity category;

  CategoryContainer({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Divider(
          height: 50,
          thickness: 3,
        ),
        Expanded(
          child: Container(
            height: context.h(82),
            color: AppColor.primaryLightColor,
            alignment: Alignment.center,
            child: Text(
              category.name!,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
