import 'package:e_commerce/ui/screens/app_layout/cubit/cubit.dart';
import 'package:e_commerce/utils/assets/colors.dart';
import 'package:e_commerce/utils/assets/images.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppLayoutCubit viewModel = AppLayoutCubit();
    return BlocConsumer(
      bloc: viewModel,
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) => Scaffold(
        backgroundColor: AppColor.whiteColor,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: BottomAppBar(
            child: BottomNavigationBar(
              onTap: (index) => viewModel.changeBottomNavItem(index),
              currentIndex: viewModel.selectedIndex,
              items: [
                BottomNavigationBarItem(
                    icon: CircleAvatar(
                      foregroundColor: viewModel.selectedIndex == 0
                          ? AppColor.primaryColor
                          : AppColor.whiteColor,
                      backgroundColor: viewModel.selectedIndex == 0
                          ? AppColor.whiteColor
                          : Colors.transparent,
                      child: const ImageIcon(
                        size: 35,
                        AssetImage(
                          AppImages.homeIcon,
                        ),
                      ),
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: CircleAvatar(
                      foregroundColor: viewModel.selectedIndex == 1
                          ? AppColor.primaryColor
                          : AppColor.whiteColor,
                      backgroundColor: viewModel.selectedIndex == 1
                          ? AppColor.whiteColor
                          : Colors.transparent,
                      child: const ImageIcon(
                        size: 35,
                        AssetImage(
                          AppImages.productIcon,
                        ),
                      ),
                    ),
                    label: 'Product'),
                BottomNavigationBarItem(
                    icon: CircleAvatar(
                      foregroundColor: viewModel.selectedIndex == 2
                          ? AppColor.primaryColor
                          : AppColor.whiteColor,
                      backgroundColor: viewModel.selectedIndex == 2
                          ? AppColor.whiteColor
                          : Colors.transparent,
                      child: const ImageIcon(
                        size: 35,
                        AssetImage(
                          AppImages.favouriteIcon,
                        ),
                      ),
                    ),
                    label: 'Favourite'),
                BottomNavigationBarItem(
                    icon: CircleAvatar(
                      foregroundColor: viewModel.selectedIndex == 3
                          ? AppColor.primaryColor
                          : AppColor.whiteColor,
                      backgroundColor: viewModel.selectedIndex == 3
                          ? AppColor.whiteColor
                          : Colors.transparent,
                      child: const ImageIcon(
                        size: 35,
                        AssetImage(
                          AppImages.userIcon,
                        ),
                      ),
                    ),
                    label: 'User'),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.routeLogo,
                  height: context.h(22),
                  width: context.w(66),
                ),
                SizedBox(
                  height: context.h(10),
                ),
                viewModel.selectedIndex != 3
                    ? Row(
                        children: [
                          Container(
                            height: context.h(50),
                            width: context.w(348),
                            child: TextFormField(
                              controller: viewModel.searchController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                hintText: 'what do you search for ?',
                                prefixIcon: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.search,
                                    size: 24,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                size: 24,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: context.h(10),
                ),
                Expanded(child: viewModel.tabsList[viewModel.selectedIndex]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
