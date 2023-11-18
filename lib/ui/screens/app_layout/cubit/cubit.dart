import 'package:bloc/bloc.dart';
import 'package:e_commerce/ui/screens/app_layout/cubit/states.dart';
import 'package:e_commerce/ui/screens/tabs/favourite_tab/favourite_tab.dart';
import 'package:e_commerce/ui/screens/tabs/home_tab/home_tab.dart';
import 'package:e_commerce/ui/screens/tabs/product_tab/product_tab.dart';
import 'package:e_commerce/ui/screens/tabs/user_tab/user_tab.dart';
import 'package:flutter/material.dart';

class AppLayoutCubit extends Cubit<AppStates> {
  AppLayoutCubit() : super(AppInitialState());
  int selectedIndex = 0;
  var searchController = TextEditingController();
  List<Widget> tabsList = [
    HomeTab(),
    ProductTab(),
    FavouriteTab(),
    UserTab(),
  ];

  void changeBottomNavItem(int index) {
    emit(AppInitialState());
    selectedIndex = index;
    emit(ChangeBottomNavItemState());
  }
}
