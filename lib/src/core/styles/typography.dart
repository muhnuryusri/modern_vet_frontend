import 'package:flutter/material.dart';
import 'package:modern_vet_submission/src/core/styles/custom_colors.dart';

class CustomText {
  static Widget text(
    String? text, {
    TextStyle? textStyle,
    TextAlign? textAlign,
  }) {
    return Text(
      text ?? "",
      style: textStyle ?? CustomTextStyle.caption,
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}

class CustomTextStyle {
  static TextStyle header = TextStyle(
    fontSize: 20,
    color: CustomColors.text,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
  );

  static TextStyle body({Color? color}) {
    return TextStyle(
      fontSize: 15,
      color: color ?? CustomColors.text,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle caption = TextStyle(
    fontSize: 15,
    color: CustomColors.text,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle placeholder = TextStyle(
    fontSize: 15,
    color: CustomColors.placeholder,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle button = TextStyle(
    fontSize: 15,
    color: CustomColors.background,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );
}
