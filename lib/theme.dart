import 'package:flutter/material.dart';

class AppColors {
  static Color navy = Color(0XFF273F4F);
  static Color black = Color(0XFF000000);
  static Color orange = Color(0XFFFE7743);
  static Color darkerOrange = Color(0XFFD5451B);

  static Color riceWhite = Color(0XFFEFEEEA);
  static Color paleBlue = Color(0XFF555879);
  static Color green = Color(0XFFA0C878);
  static Color yellow = Color(0XFFFFEB00);

}

ThemeData primaryTheme = ThemeData(

  //seed color
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.navy,
  ),

  //scaffold color
  scaffoldBackgroundColor: AppColors.riceWhite,

  //app bar theme color
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.orange,
    foregroundColor: AppColors.riceWhite,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
  ),

  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.black,
      fontSize: 16,
      letterSpacing: 1
    ),
    headlineMedium: TextStyle(
      color: AppColors.navy,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 1
    ),
    titleMedium: TextStyle(
      color: AppColors.paleBlue,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 2
    )
  ),

  cardTheme: CardThemeData(
    color: Color.lerp(AppColors.riceWhite, Colors.black, 0.1)!, // 稍微深一点
    surfaceTintColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)), // 或者更大的值如16、20
    ),
    shadowColor: Colors.transparent,
    margin: const EdgeInsets.only(bottom: 16)
  )


);

