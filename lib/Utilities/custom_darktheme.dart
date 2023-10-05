import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_textstyle.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        fontFamily: 'AnekMalayalam',
        dialogBackgroundColor: isDarkTheme
            ? AppColorPalette.dbackgroundColor
            : AppColorPalette.white,
        hintColor: isDarkTheme ? AppColorPalette.white : AppColorPalette.black,
        // backgroundColor: isDarkTheme
        //     ? AppColorPalette.dbackgroundColor
        //     : AppColorPalette.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: isDarkTheme
                ? AppColorPalette.dbackgroundColor
                : AppColorPalette.white,
            selectedItemColor: isDarkTheme
                ? AppColorPalette.risalaColor
                : AppColorPalette.risalaColor,
            unselectedItemColor:
            isDarkTheme ? AppColorPalette.white : AppColorPalette.grey),
        appBarTheme: AppBarTheme(
            backgroundColor: isDarkTheme
                ? AppColorPalette.dbackgroundColor
                : AppColorPalette.white,
            foregroundColor:
            isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
        scaffoldBackgroundColor: isDarkTheme
            ? AppColorPalette.dbackgroundColor
            : AppColorPalette.white,
        textTheme: TextTheme(
          headlineLarge: AppTextStyle.extraLargeBold(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          headlineMedium: AppTextStyle.extraLargeMedium(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          headlineSmall: AppTextStyle.extraLargeRegular(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          bodyLarge: AppTextStyle.largeBold(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          bodyMedium: AppTextStyle.largeMedium(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          bodySmall: AppTextStyle.largeRegular(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          labelLarge: AppTextStyle.mediumBold(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          labelMedium: AppTextStyle.mediumMedium(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          labelSmall: AppTextStyle.mediumRegular(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          titleLarge: AppTextStyle.lightMediumBold(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          titleMedium: AppTextStyle.lightMediumMedium(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          titleSmall: AppTextStyle.lightMediumRegular(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          displayLarge: AppTextStyle.smallBold(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          displayMedium: AppTextStyle.smallMedium(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
          displaySmall: AppTextStyle.extraSmallRegular(
              color:
              isDarkTheme ? AppColorPalette.white : AppColorPalette.black),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
            textStyle: AppTextStyle.smallBold(
                color: isDarkTheme
                    ? AppColorPalette.white
                    : AppColorPalette.black),
            menuStyle: MenuStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (isDarkTheme == true) {
                  return AppColorPalette.white;
                }
                return AppColorPalette.black;
              }),
            )),
        colorSchemeSeed:
        isDarkTheme ? AppColorPalette.white : AppColorPalette.black);
  }
}
