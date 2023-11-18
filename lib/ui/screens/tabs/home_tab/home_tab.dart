import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/ui/screens/tabs/home_tab/announcement_widget.dart';
import 'package:e_commerce/ui/screens/tabs/home_tab/categoryWidget.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, page) => AnnouncementWidget(
            index: index,
          ),
          options: CarouselOptions(
            autoPlay: true,
            height: context.h(200),
            autoPlayInterval: const Duration(seconds: 3),
          ),
        ),
        SizedBox(
          height: context.h(10),
        ),
        Row(
          children: [
            Text(
              'Categories',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            Text(
              'view all',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(
          height: context.h(10),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 5, crossAxisSpacing: 5),
            itemBuilder: (context, index) => const CategoryWidget(),
            itemCount: 8,
          ),
        ),
        SizedBox(
          height: context.h(10),
        ),
        Row(
          children: [
            Text(
              'Categories',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            Text(
              'view all',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(
          height: context.h(10),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 5, crossAxisSpacing: 5),
            itemBuilder: (context, index) => const CategoryWidget(),
            itemCount: 8,
          ),
        ),
      ],
    );
  }
}
