import 'package:flutter/material.dart';

import 'app_colors.dart';

class Kstyles {
  Text thin({
    required String text,
    required double size,
    Color color = AppColors.backgroundColor,
    double? height,
    bool? softWrap,
    int? maxLines,
    TextAlign? textAlign,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Lato",
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontSize: size,
        height: height,
        color: color,
        fontWeight: FontWeight.w300,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
    );
  }

  Text light({
    required String text,
    required double size,
    Color color = AppColors.backgroundColor,
    double? height,
    bool? softWrap,
    int? maxLines,
    TextAlign? textAlign,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Lato",
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontSize: size,
        height: height,
        color: color,
        fontWeight: FontWeight.w400,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
    );
  }

  Text reg({
    required String text,
    required double size,
    Color color = AppColors.backgroundColor,
    double? height,
    bool? softWrap,
    int? maxLines,
    TextAlign? textAlign,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Lato",
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontSize: size,
        height: height,
        color: color,
        fontWeight: FontWeight.w500,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
    );
  }

  Text med({
    required String text,
    required double size,
    Color color = AppColors.backgroundColor,
    double? height,
    bool? softWrap,
    int? maxLines,
    TextAlign? textAlign,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Lato",
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontSize: size,
        height: height,
        color: color,
        fontWeight: FontWeight.w600,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
    );
  }

  Text semiBold({
    required String text,
    required double size,
    Color color = AppColors.backgroundColor,
    double? height,
    bool? softWrap,
    int? maxLines,
    TextAlign? textAlign,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Lato",
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontSize: size,
        height: height,
        color: color,
        fontWeight: FontWeight.w700,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
    );
  }

  Text bold({
    required String text,
    required double size,
    Color color = AppColors.backgroundColor,
    double? height,
    bool? softWrap,
    int? maxLines,
    TextAlign? textAlign,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Lato",
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontSize: size,
        height: height,
        color: color,
        fontWeight: FontWeight.w800,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
    );
  }
}
