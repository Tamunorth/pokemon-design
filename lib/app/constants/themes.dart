import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme(Color scheme) => ThemeData(
      hintColor: Color(0xff868686),
      colorScheme: ColorScheme.fromSeed(seedColor: scheme).copyWith(
        primary: scheme,
        secondaryContainer: const Color(0xffF1F1F1),
      ),
      useMaterial3: true,
      fontFamily: GoogleFonts.sofiaSans().fontFamily,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
        ),
        titleLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 15,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        hintStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: scheme),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: scheme),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff868686),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        focusColor: scheme,
        hoverColor: scheme,
      ),
    );
