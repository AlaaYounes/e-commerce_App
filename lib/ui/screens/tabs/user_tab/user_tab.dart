import 'package:e_commerce/utils/assets/colors.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class UserTab extends StatelessWidget {
  const UserTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome, Mohamed',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: context.h(20),
        ),
        Text(
          'Your full name',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: context.h(10),
        ),
        Container(
          width: context.w(398),
          height: context.h(54),
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.primaryColor.withOpacity(.3),
            ),
          ),
          child: Text(
            'Mohamed Mohamed Nabil',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
          ),
        ),
        SizedBox(
          height: context.h(20),
        ),
        Text(
          'Your E-mail',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: context.h(10),
        ),
        Container(
          width: context.w(398),
          height: context.h(54),
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.primaryColor.withOpacity(.3),
            ),
          ),
          child: Text(
            'mohamed.N@gmail.com',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
          ),
        ),
        SizedBox(
          height: context.h(20),
        ),
        Text(
          'Your password',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: context.h(10),
        ),
        Container(
          width: context.w(398),
          height: context.h(54),
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.primaryColor.withOpacity(.3),
            ),
          ),
          child: Text(
            '**********************',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
          ),
        ),
        SizedBox(
          height: context.h(20),
        ),
        Text(
          'Your mobile number',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: context.h(10),
        ),
        Container(
          width: context.w(398),
          height: context.h(54),
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.primaryColor.withOpacity(.3),
            ),
          ),
          child: Text(
            '01122118855',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
          ),
        ),
        SizedBox(
          height: context.h(20),
        ),
        Text(
          'Your Address',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: context.h(10),
        ),
        Container(
          width: context.w(398),
          height: context.h(54),
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.primaryColor.withOpacity(.3),
            ),
          ),
          child: Text(
            '6th October, street 11.....',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
