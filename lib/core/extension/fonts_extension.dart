import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';

sealed class AppFonts {
  static const String poppins = "Poppins";
}

extension FontsExtension on BuildContext {
  TextStyle get label10400 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      );

  TextStyle get label10500 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      );

  TextStyle get label12400 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  TextStyle get label12600 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  TextStyle get label12500 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );

  TextStyle get label14400 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
  TextStyle get label14500 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
  TextStyle get label14600 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );
  TextStyle get label15400 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      );

  TextStyle get label16400 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get label16600 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  TextStyle get label16700 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );

  TextStyle get label16500 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  TextStyle get label18500 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );

  TextStyle get label18600 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );
  TextStyle get label20500 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );

  TextStyle get label24500 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      );
  TextStyle get label24600 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );
  TextStyle get label22500 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      );

  TextStyle get label30500 => TextStyle(
        fontFamily: AppFonts.poppins,
        color: AppColors.textColor,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      );
}
