import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  //
  // static const Color locationBagdatColor = Color(0xFF2e7d32);
  // static const Color locationEtilerColor = Color(0xFF616161);
  // static const Color locationNisantasiColor = Color(0xFF00838f);

  static const Color primaryColor = Color(0xFF03A9F5);
  static const Color backgroundColor = Color(0xFFFFFFFF);

  static const Color textColor = Color(0xFF303030);
  static const Color iconColor = Color(0xFF303030);
  static const Color blackColor = Color(0xFF212121);

  static const Color greyAppleColor = Color(0xFF2F2F2F);

  static const Color greenColor = Color(0xFF79C68C);
  static const Color greenColor1 = Color(0xFF86cc98);
  static const Color greenColor2 = Color(0xFF94d1a3);
  static const Color greenColor3 = Color(0xFFa1d7af);
  static const Color greenColor4 = Color(0xFFafddba);
  static const Color greenColor5 = Color(0xFFbce3c6);
  static const Color greenColor6 = Color(0xFFc9e8d1);

  static const Color  redColor = Color(0xFFFB2B3A);
  static const Color  redColor1 = Color(0xFFf43440);
  static const Color  redColor2 = Color(0xFFea3e4a);
  static const Color  redColor3 = Color(0xFFdf4953);
  static const Color  redColor4 = Color(0xFFd4545c);
  static const Color  redColor5 = Color(0xFFc95e65);
  static const Color  redColor6 = Color(0xFFb47478);


  static const Color greyColor6 = Color(0xfffafafa);
  static const Color greyColor5 = Color(0xfff5f5f5);
  static const Color greyColor4 = Color(0xFFeeeeee);
  static const Color greyColor3 = Color(0xFFe0e0e0);
  static const Color greyColor2 = Color(0xFFbdbdbd);
  static const Color greyColor1 = Color(0xFF9e9e9e);
  static const Color greyColor = Color(0xFF757575);

  static const Color orangeColor5 = Color(0xFFFFF1E4);
  static const Color orangeColor4 = Color(0xFFFFDDBB);
  static const Color orangeColor3 = Color(0xFFFFC68E);
  static const Color orangeColor2 = Color(0xFFFFAF61);
  static const Color orangeColor1 = Color(0xFFFF9E3F);
  static const Color orangeColor = Color(0xFFFF8D1D);

  static const Color darkBlueColor = Color(0xFF01579b);
  static const Color darkBlueGreyColor = Color(0xFF37474f);


  static const Color blueColor = Color(0xFF03A9F5);
  static const Color blueColor1 = Color(0xFF1cb2f6);
  static const Color blueColor2 = Color(0xFF35baf7);
  static const Color blueColor3 = Color(0xFF4fc3f8);
  static const Color blueColor4 = Color(0xFF68cbf9);
  static const Color blueColor5 = Color(0xFF81d4fa);

  static const Color whiteColor = Color(0xffffffff);

  static final ThemeData theme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(

      selectionColor: AppTheme.textColor,
      selectionHandleColor: AppTheme.textColor,
      cursorColor: AppTheme.textColor,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: whiteColor, //--> optional if you want to change the background color
      surfaceTintColor: whiteColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    fontFamily: 'Montserrat-Regular',
    appBarTheme: _appBarTheme,
    dividerTheme: _dividerThemeData,
    textTheme: _textTheme,
  );

  static const TextTheme _textTheme = TextTheme(
    // displayLarge: TextStyle(
    //   fontSize: 70,
    //   fontWeight: FontWeight.bold,
    // ),
    titleSmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      fontFamily: 'Montserrat-Medium',
      color: textColor,
    ),
    titleMedium: TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat-Medium',
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
    titleLarge: TextStyle(
      fontSize: 17,
      fontFamily: 'Montserrat-Medium',
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
    bodySmall: TextStyle(
      fontSize: 13,
      fontFamily: 'Montserrat-Regular',
      color: textColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat-Regular',
      color: textColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 17,
      fontFamily: 'Montserrat-Regular',
      color: textColor,
    ),
  );

  static final _appBarTheme = AppBarTheme(
    elevation: 2,
    shadowColor: AppTheme.whiteColor,
    surfaceTintColor: AppTheme.whiteColor,
    backgroundColor: AppTheme.whiteColor,
    scrolledUnderElevation: 2,
    centerTitle: true,
    iconTheme: const IconThemeData(color: iconColor),
    toolbarTextStyle: _textTheme.bodyMedium,
    titleTextStyle: _textTheme.titleMedium,
  );

  static const DividerThemeData _dividerThemeData = DividerThemeData(
    color: whiteColor,
  );
}
