import 'package:flutter/material.dart';


class AppScale {

  final BuildContext context;
  const AppScale(this.context,);

  double get width => scaledWidth(1);
  double get height => scaledHeight(1);

  double get buttonHeight => scaledHeight(55 / 896);
  double get pagePadding {
      if (MediaQuery.of(context).size.width >= 768) {
        return scaledWidth(1 / 45);
      }
      else {
        return scaledWidth(1 / 20);
      }
  }

  double get contentPadding
  {
    if (MediaQuery.of(context).size.width >= 768) {
      return scaledWidth(1 / 60);
    }
    else {
      return scaledWidth(1 / 25);
    }
  }

  double get illustrationWidth => scaledWidth(2 / 3);

  double scaledWidth(double widthScale) {
    return MediaQuery.of(context).size.width * widthScale;
  }

  double scaledHeight(double heightScale) {
    return MediaQuery.of(context).size.height * heightScale;
  }
}
