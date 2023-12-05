import 'package:e_commerce/utils/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';

class AnnouncementWidget extends StatelessWidget {
  int index;

  AnnouncementWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Image.asset(
        'assets/images/announcement${index + 1}.png',
        height: context.h(200),
        width: context.w(396),
      ),
    );
  }
}
