import 'package:flutter/cupertino.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  double h(double percentage) {
    var h = percentage / 932;
    return MediaQuery.of(this).size.height * h;
  }

  double w(double percentage) {
    var w = percentage / 430;
    return MediaQuery.of(this).size.width * w;
  }

  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;
}
