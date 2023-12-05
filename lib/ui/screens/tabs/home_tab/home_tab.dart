import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/domain/injection.dart';
import 'package:e_commerce/ui/screens/tabs/home_tab/announcement_widget.dart';
import 'package:e_commerce/ui/screens/tabs/home_tab/categoryWidget.dart';
import 'package:e_commerce/ui/screens/tabs/home_tab/cubit/cubit.dart';
import 'package:e_commerce/ui/screens/tabs/home_tab/cubit/states.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/product_container.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  HomeTabCubit viewModel =
      HomeTabCubit(getCategoryUseCase: injectGetCategoryUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabStates>(
        bloc: viewModel..getCategory(),
        // ..getBrands(),
        builder: (context, state) {
          return viewModel.categoriesList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
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
                              .copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.h(10),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductContainer(
                                        categoryId:
                                            viewModel.categoriesList[index].id!,
                                      )),
                            );
                          },
                          child: CategoryWidget(
                              category: viewModel.categoriesList[index]),
                        ),
                        itemCount: viewModel.categoriesList.length,
                      ),
                    ),
                    // SizedBox(
                    //   height: context.h(10),
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Categories',
                    //       style: Theme.of(context).textTheme.titleSmall,
                    //     ),
                    //     const Spacer(),
                    //     Text(
                    //       'view all',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .titleSmall!
                    //           .copyWith(
                    //               fontSize: 12, fontWeight: FontWeight.w400),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: context.h(10),
                    // ),
                    // Expanded(
                    //   child: GridView.builder(
                    //     gridDelegate:
                    //         const SliverGridDelegateWithFixedCrossAxisCount(
                    //             crossAxisCount: 4,
                    //             mainAxisSpacing: 5,
                    //             crossAxisSpacing: 5),
                    //     itemBuilder: (context, index) =>
                    //         BrandWidget(brand: viewModel.brandsList![index]),
                    //     itemCount: viewModel.brandsList.length,
                    //   ),
                    // ),
                  ],
                );
        });
  }
}
