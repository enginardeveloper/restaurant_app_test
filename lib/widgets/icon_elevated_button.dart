import 'package:flutter/material.dart';
import '../core/app_scale/app_scale.dart';

import '../core/constants/app_dimensions/app_dimensions.dart';
import 'svg_icon.dart';

class IconElevatedButton extends StatelessWidget {
  const IconElevatedButton({
    Key? key,
    this.onPressed,
    required this.asset,
    required this.iconSize,
    this.iconColor = Colors.white,
    required this.color,
    this.disabledColor,
  }) : super(key: key);

  final GestureTapCallback? onPressed;
  final double iconSize;
  final Color iconColor;
  final String asset;
  final Color color;
  final Color? disabledColor;

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return Container(
      width: AppDimensions.buttonWidth,
      height: AppDimensions.buttonHeight,
      margin: EdgeInsets.only(
        bottom: scale.pagePadding,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          backgroundColor: color,
          disabledBackgroundColor: disabledColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadius * 2),
          ),
        ),
        onPressed: onPressed,
        child: SvgIcon(
          asset: asset,
          shadow: false,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
