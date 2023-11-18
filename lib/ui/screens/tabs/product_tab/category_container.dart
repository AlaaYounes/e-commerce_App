import 'package:e_commerce/utils/assets/colors.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(
          10,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
                color: AppColor.primaryColor.withOpacity(.3), width: 1),
            top: BorderSide(
                color: AppColor.primaryColor.withOpacity(.3), width: 1),
          ),
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(10),),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Row(
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
                          'Mens fashion',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
