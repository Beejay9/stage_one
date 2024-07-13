import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stage_one/app/constants/app_colors.dart';

import '../constants/app_text_style.dart';

class MyTextField extends StatelessWidget {
  String? hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obscureText;
  bool autocorrect;
  int? minLines;
  int? maxLines;
  int? maxLength;
  String? initialValue;
  FocusNode? focusNode;
  TextEditingController? controller;
  TextInputType? keyboardType;
  TextCapitalization textCapitalization;
  void Function(String)? onFieldSubmitted;
  void Function(String?)? onSaved;
  String? Function(String?)? validator;

  MyTextField({
    super.key,
    this.hintText,
    this.focusNode,
    this.controller,
    this.obscureText = false,
    this.autocorrect = false,
    this.maxLines = 1,
    this.minLines,
    this.initialValue,
    this.maxLength,
    this.onFieldSubmitted,
    this.onSaved,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: autocorrect,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 10.w,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.subTextColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(13.r),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(13.r),
          ),
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.regular(
          color: AppColors.subTextColor,
          fontSize: 15.spMax,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.mainTextColor,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.subTextColor,

      ),
      initialValue: initialValue,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: AppColors.mainTextColor,
      focusNode: focusNode,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      controller: controller,
      textCapitalization: textCapitalization,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
    );
  }}