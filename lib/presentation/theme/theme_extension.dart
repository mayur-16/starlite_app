

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

extension TextThemeExtension on TextTheme {

  TextStyle get formfieldtextStyle => const TextStyle(
    color: AppColors.mainBlack,
    fontWeight: FontWeight.w300,
    fontSize: 14,
    letterSpacing: 0.2,
  );

}