import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/style/app_text_style.dart';


class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF3F3F3),
    primaryColor: Colors.black,
    iconTheme: const IconThemeData(color: AppColors.c_121212),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    dialogBackgroundColor: const Color(0xFFF3F3F3),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedLabelStyle: AppTextStyle.regular
          .copyWith(fontSize: 12, color: AppColors.c_121212),
      selectedLabelStyle: AppTextStyle.regular
          .copyWith(fontSize: 12, color: AppColors.c_121212),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: AppColors.c_121212,
      selectedItemColor: AppColors.c_121212,
      selectedIconTheme: const IconThemeData(
        color: AppColors.c_121212,
      ),

    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF3F3F3),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColors.c_121212,
        fontFamily: "Lato",
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF006874),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF97F0FF),
      onPrimaryContainer: Color(0xFF001F24),
      secondary: Color(0xFF4A6267),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFCDE7EC),
      onSecondaryContainer: Color(0xFF051F23),
      tertiary: Color(0xFF525E7D),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFDAE2FF),
      onTertiaryContainer: Color(0xFF0E1B37),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410002),
      background: Colors.white,
      onBackground: Color(0xFF191C1D),
      surface: Color(0xFFFAFDFD),
      onSurface: Color(0xFF191C1D),
      surfaceVariant: Color(0xFFDBE4E6),
      onSurfaceVariant: Color(0xFF3F484A),
      outline: Color(0xFF6F797A),
      onInverseSurface: Color(0xFFEFF1F1),
      inverseSurface: Color(0xFF2E3132),
      inversePrimary: Color(0xFF4FD8EB),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF006874),
      outlineVariant: Color(0xFFBFC8CA),
      scrim: Color(0xFF000000),
    ),
    useMaterial3: true,
  );
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.c_121212,
      iconTheme: const IconThemeData(color: AppColors.cFFFFFF),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: AppColors.c_363636),
      dialogBackgroundColor: AppColors.c_363636,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.c_363636,
        unselectedLabelStyle: AppTextStyle.regular.copyWith(fontSize: 12),
        selectedLabelStyle: AppTextStyle.regular.copyWith(fontSize: 12),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.cFFFFFF,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.c_121212,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontFamily: "Lato",
          fontWeight: FontWeight.w500,
        ),
      ),
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF4FD8EB),
        onPrimary: Color(0xFF00363D),
        primaryContainer: Color(0xFF004F58),
        onPrimaryContainer: Color(0xFF97F0FF),
        secondary: Color(0xFFB1CBD0),
        onSecondary: Color(0xFF1C3438),
        secondaryContainer: Color(0xFF334B4F),
        onSecondaryContainer: Color(0xFFCDE7EC),
        tertiary: Color(0xFFBAC6EA),
        onTertiary: Color(0xFF24304D),
        tertiaryContainer: Color(0xFF3B4664),
        onTertiaryContainer: Color(0xFFDAE2FF),
        error: Color(0xFFFFB4AB),
        errorContainer: Color(0xFF93000A),
        onError: Color(0xFF690005),
        onErrorContainer: Color(0xFFFFDAD6),
        background: AppColors.c_363636,
        onBackground: Color(0xFFE1E3E3),
        surface: Color(0xFF191C1D),
        onSurface: Color(0xFFE1E3E3),
        surfaceVariant: Color(0xFF3F484A),
        onSurfaceVariant: Color(0xFFBFC8CA),
        outline: Color(0xFF899294),
        onInverseSurface: Color(0xFF191C1D),
        inverseSurface: Color(0xFFE1E3E3),
        inversePrimary: Color(0xFF006874),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF4FD8EB),
        outlineVariant: Color(0xFF3F484A),
        scrim: Color(0xFF000000),
      ));
}
