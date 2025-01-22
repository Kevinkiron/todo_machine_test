import 'package:flutter/material.dart';

import 'package:todo/utils/global.dart';

import 'app_colors.dart';
import 'kstyles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.color,
    this.textColor,
    this.text,
    required this.onTap,
    this.height = 50,
    this.width,
    this.border,
    this.loading,
    this.child,
  });
  final bool? loading;
  final Color? color;
  final Color? textColor;
  final String? text;
  final double height;
  final double? width;
  final BoxBorder? border;
  final Widget? child;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          border: border,
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading ?? false
              ? child
              : Kstyles().bold(
                  text: text ?? '',
                  color: textColor ?? AppColors.backgroundColor,
                  size: 14,
                ),
        ),
      ),
    );
  }
}
