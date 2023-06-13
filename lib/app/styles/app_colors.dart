import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  AppColors._();

  static AppColors get instance {
    _instance ??= AppColors._();
    return _instance!;
  }

  // Color get primary => const Color(0XFFFFD700);
  // Color get secondary => const Color(0XFF483D8B);
  // Color get background => const Color(0XFF333A45);
  Color get background => Colors.black;
}

extension AppColorsExtentions on BuildContext {
  AppColors get colors => AppColors.instance;
}
