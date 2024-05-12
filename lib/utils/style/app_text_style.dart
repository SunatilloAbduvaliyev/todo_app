import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppTextStyle{
  //light
  static  TextStyle light = const TextStyle(
      color: AppColors.c_121212,
      fontSize: 12,
      fontWeight: FontWeight.w300,
      fontFamily: 'Lugrasimo'
  );
  //regular
  static  TextStyle regular = const TextStyle(
      color: AppColors.c_121212,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Lugrasimo'
  );
  //medium
  static  TextStyle medium = const TextStyle(
      color: AppColors.c_121212,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Lugrasimo'
  );
  //bold
  static  TextStyle bold = const TextStyle(
      color: AppColors.c_121212,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'Lugrasimo'
  );
  //semi bold
  static  TextStyle semiBold = const TextStyle(
      color: AppColors.c_121212,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: 'Lugrasimo'
  );
}