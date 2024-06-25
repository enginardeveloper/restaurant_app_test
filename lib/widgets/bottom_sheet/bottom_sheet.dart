import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/app_scale/app_scale.dart';
import '../../core/constants/app_dimensions/app_dimensions.dart';

Future<void> bottomSheet(BuildContext context, Widget child, double height) {

  AppScale scale = AppScale(context);

  Future<void> future = showModalBottomSheet(
    enableDrag: false,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(scale.pagePadding * 2),
        topRight: Radius.circular(scale.pagePadding * 2),
      ),
    ),
    context: context,
    builder: (context) {
      return AnimatedContainer(
        height: height,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom +
              (Platform.isIOS ? scale.pagePadding : scale.pagePadding * 2),
        ),
        duration: const Duration(
          milliseconds: AppDimensions.bottomSheetTransitionDuration,
        ),
        padding: EdgeInsets.only(
            top: scale.pagePadding,
            left: scale.pagePadding,
            right: scale.pagePadding,
            bottom: scale.pagePadding,
            //+ (Platform.isIOS ? 20 : 0)
       ),
        child: child,
      );
    },
  );
  return future;
}