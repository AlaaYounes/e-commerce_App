import 'package:e_commerce/domain/entities/category/CategoryResponseEntity.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryEntity category;

  CategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              category.image ?? '',
            ),
            radius: 40,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          category.name ?? '',
          style: Theme.of(context).textTheme.labelSmall,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
