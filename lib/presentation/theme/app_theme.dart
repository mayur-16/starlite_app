
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme(context) => ThemeData().copyWith(

        textTheme: GoogleFonts.interTextTheme().copyWith(
          titleMedium: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.mainBlack,
            ),
          ),
          bodyMedium: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.mainBlack,
            ),
          ),
          bodySmall: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: AppColors.hintText,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              )
          ),
          displaySmall: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                letterSpacing: 0.2,
              )
          ),
          labelSmall: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: AppColors.mainBlack,
                fontWeight: FontWeight.w400,
                fontSize: 15,
                letterSpacing: 0.2
              )
          ),
        ),
        primaryColor: AppColors.primaryColor,
        splashColor: AppColors.primaryColor.withOpacity(0.5),
        primaryTextTheme: GoogleFonts.interTextTheme(),
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: AppColors.pureWhite,
          ),
          color: AppColors.appBarColor,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.pureWhite,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
            foregroundColor: MaterialStateProperty.all(AppColors.pureWhite),
            elevation: MaterialStateProperty.all(0),
            minimumSize: MaterialStateProperty.all(const Size(double.infinity, 48)),

            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            ),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),

            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.pureWhite,
                fontFamily: GoogleFonts.inter().fontFamily,
              ),
            ),
            iconColor: MaterialStateProperty.all(AppColors.pureWhite),
          ),
        ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor2,
      foregroundColor: AppColors.pureWhite,
      extendedTextStyle:
        TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: AppColors.pureWhite,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
           const BorderSide(
            color: AppColors.outlinedButtonBorder,
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 56),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
        ),
        foregroundColor: MaterialStateProperty.all(
          AppColors.mainBlack,
        ),
        backgroundColor: MaterialStateProperty.all(
          AppColors.pureWhite,
        ),
        iconSize: MaterialStateProperty.all(20),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.w500,
           // fontFamily: GoogleFonts.inter().fontFamily,
            fontSize: 16,
            color: AppColors.mainBlack,
          ),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      contentPadding:
      EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
      errorMaxLines: 2,
     hintStyle: TextStyle(
       color: AppColors.hintText,
       fontWeight: FontWeight.w400,
       fontSize: 15,
       //fontFamily: GoogleFonts.inter().fontFamily,
     ),
      floatingLabelStyle: TextStyle(
        color: AppColors.hintText,
        fontWeight: FontWeight.w300,
        fontSize: 14,
        //fontFamily: GoogleFonts.inter().fontFamily,
      ),
      labelStyle: TextStyle(
        color: AppColors.hintText,
        fontWeight: FontWeight.w300,
        fontSize: 12,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(color: AppColors.textFieldBorder),
      ),
    ),

      );
}
