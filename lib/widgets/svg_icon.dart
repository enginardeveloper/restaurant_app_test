import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../core/app_theme/app_theme.dart';
import '../core/constants/app_dimensions/app_dimensions.dart';

class SvgIcon extends StatelessWidget {
  final double size;
  final String asset;
  final Color color;
  final bool shadow;

  const SvgIcon(
      {this.size = AppDimensions.iconSize,
      required this.asset,
      this.color = AppTheme.iconColor,
      this.shadow = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (shadow) {
      return SimpleShadow(
        opacity: 0.1,
        sigma: 1,
        child: SvgPicture.asset(
          asset,
          width: size,
          height: size,
          color: color,
        ),
      );
    } else {
      return SvgPicture.asset(
        asset,
        width: size,
        height: size,
        color: color,
      );
    }
  }
}
