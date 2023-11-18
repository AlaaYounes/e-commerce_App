import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CircleAvatar(
            radius: 50,
            child: Image.asset(
              'assets/images/category.png',
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          'Fashion',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
