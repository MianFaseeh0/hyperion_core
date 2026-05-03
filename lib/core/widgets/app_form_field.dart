import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class AppFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool filled;
  final int? maxLines;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final double? height;

  const AppFormField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.fillColor,
    this.filled = true,
    this.maxLines = 1,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.focusNode,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      style: AppTextStyles.body,
      textInputAction: textInputAction ?? TextInputAction.next,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.bodyCaption,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ??
             EdgeInsets.symmetric(horizontal: 16, vertical: height ?? 14),
        fillColor: fillColor,
        filled: filled,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.grey.shade600,
                width: 0.5
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade600,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.grey.shade800,
                width: 2.0
            )
        ),
      ),
    );
  }
}