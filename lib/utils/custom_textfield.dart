import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.controller,
    this.onSubmit,
    this.color,
    this.validator,
    this.onChanged,
    required this.hintText,
    this.autofocus,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.maxLines,
  });
  final TextEditingController? controller;
  final bool? autofocus;
  final void Function(String)? onSubmit;
  final String hintText;
  final Color? color;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;

  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      maxLines: maxLines,
      autofocus: autofocus ?? false,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.black.withValues(alpha: 0.9),
        fontSize: 12,
        fontFamily: "Inter",
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: color ?? AppColors.backgroundColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.black.withValues(alpha: 0.1),
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w200,
          color: AppColors.black,
          fontSize: 12,
          fontFamily: "Inter",
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.black.withValues(alpha: 0.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.4),
          ),
        ),
      ),
    );
  }
}
