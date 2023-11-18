import 'package:e_commerce/utils/assets/colors.dart';
import 'package:e_commerce/utils/assets/images.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.w(190),
          height: context.h(240),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.primaryColor.withOpacity(.3),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Image.asset('assets/images/shoes.png')),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Nike Air Jordon Nike shoes flexible for wo..',
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'EGP 1,200 ',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reviews (4.6)',
                      style: Theme.of(context).textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 15,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10, top: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: ImageIcon(
              AssetImage(AppImages.favouriteIcon),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10, bottom: 10),
          child: Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.primaryColor,
                ),
                child: Icon(
                  Icons.add,
                  color: AppColor.whiteColor,
                  size: 25,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
