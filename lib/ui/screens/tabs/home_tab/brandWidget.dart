import 'package:e_commerce/domain/entities/category/CategoryResponseEntity.dart';
import 'package:flutter/material.dart';

class BrandWidget extends StatelessWidget {
  CategoryEntity brand;

  BrandWidget({required this.brand});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              brand.image ?? '',
            ),
            radius: 70,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          brand.name ?? '',
          style: Theme.of(context).textTheme.labelSmall,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
