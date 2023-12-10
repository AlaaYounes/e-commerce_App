import 'package:e_commerce/utils/assets/colors.dart';
import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColor.primaryColor.withOpacity(.3),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/test.png'),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Nike Air Jordon Nike shoes flexible for wo..',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColor.primaryDarkColor),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.delete_outlined,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.h(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'EGP 1,200 ',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: AppColor.primaryDarkColor),
                        ),
                        Container(
                          width: context.w(122),
                          height: context.h(42),
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(20),
                              right: Radius.circular(20),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  // viewModel.minus(product.price!);
                                },
                                child: Icon(
                                  Icons.remove_circle_outline_outlined,
                                  color: AppColor.whiteColor,
                                  size: 25,
                                ),
                              ),
                              Text('1'),
                              // Text('${viewModel.count}'),
                              InkWell(
                                onTap: () {
                                  // viewModel.add(product.price!);
                                },
                                child: Icon(
                                  Icons.add_circle_outline_sharp,
                                  color: AppColor.whiteColor,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
