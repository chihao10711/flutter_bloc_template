import 'package:flutter/material.dart';

import 'theme.dart';

extension ThemeDataExt on ThemeData {
  static ThemeData build(ThemeMode? mode) {
    switch (mode) {
      case ThemeMode.dark:
        return ThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColors.black,
          fontFamily: AppTextStyle.fontFamily,
        );
      case ThemeMode.light:
      default:
        return ThemeData(
          brightness: Brightness.light,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
          primaryColor: AppColors.primaryColor,
          hoverColor: AppColors.hoverColor,
          hintColor: AppColors.hintColor,
          disabledColor: AppColors.disabledColor,
          backgroundColor: AppColors.backgroundColor,
          errorColor: AppColors.errorColor,
          fontFamily: AppTextStyle.fontFamily,
          textTheme: TextTheme(
            headline1: AppTextStyle.headline1,
            // ...
          ),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: AppColors.primaryColor),
        );
    }
  }
}
