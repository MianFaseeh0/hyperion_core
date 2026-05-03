import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import 'app_text_widget.dart';

enum AppButtonSize {
  small,
  medium,
  large,
  extraLarge,
  extraLargeCircled,
  fullWidth,
}

class AppElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final AppButtonSize size;
  final Color? backgroundColor;
  final Color? textColor;
  final String? icon;
  final bool isDisabled;
  final bool isLoading;
  final Color? borderColor;
  final double? borderWidth;
  final Color? disabledColor;
  final bool isInverted;
  final Color? disabledTextColor;
  final double? height;

  const AppElevatedButton({
    super.key,
    required this.title,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.isDisabled = false,
    this.isInverted = false,
    this.isLoading = false,
    this.borderColor,
    this.borderWidth,
    this.disabledColor,
    this.height,
    this.disabledTextColor,
  });

  double get _borderRadius {
    switch (size) {
      case AppButtonSize.small:
        return 30; // fully rounded small pill
      case AppButtonSize.medium:
        return 12;
      case AppButtonSize.large:
        return 12;
      case AppButtonSize.extraLarge:
        return 10;
      case AppButtonSize.extraLargeCircled:
        return 200;
      case AppButtonSize.fullWidth:
        return 50;
    }
  }

  EdgeInsets get _padding {
    switch (size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
      case AppButtonSize.extraLarge:
        return const EdgeInsets.symmetric(horizontal: 28, vertical: 20);
      case AppButtonSize.extraLargeCircled:
        return const EdgeInsets.symmetric(horizontal: 28, vertical: 20);
      case AppButtonSize.fullWidth:
        return const EdgeInsets.symmetric(vertical: 12, horizontal: 14);
    }
  }

  TextStyle get _textStyle {
    switch (size) {
      case AppButtonSize.small:
        return AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600);
      case AppButtonSize.medium:
        return AppTextStyles.body.copyWith(fontWeight: FontWeight.w600);
      case AppButtonSize.large:
        return AppTextStyles.title.copyWith(fontWeight: FontWeight.w600);
      case AppButtonSize.extraLarge:
        return AppTextStyles.headline3.copyWith(fontWeight: FontWeight.w600);
      case AppButtonSize.extraLargeCircled:
        return AppTextStyles.headline3.copyWith(fontWeight: FontWeight.w600);
      case AppButtonSize.fullWidth:
        return AppTextStyles.headline6.copyWith(fontWeight: FontWeight.w600);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color resolvedBgColor = isDisabled
        ? (disabledColor ?? Colors.grey.shade300)
        : isInverted
        ? Colors.transparent
        : (backgroundColor ?? AppThemes.primaryColor);

    final Color resolvedTextColor = isDisabled
        ? (disabledTextColor ?? Colors.white)
        : isInverted
        ? (textColor ?? AppThemes.primaryColor)
        : (textColor ?? Colors.white);

    final Color resolvedBorderColor =
        borderColor ??
        (isInverted ? AppThemes.primaryColor : Colors.transparent);

    Widget child = isLoading
        ? Center(
            child: SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(),
            ),
          )
        : AppTextWidget(
            data: title,
            textStyle: _textStyle.copyWith(color: resolvedTextColor),
            textAlign: TextAlign.center,
          );

    Widget content = AppTextWidget(
      data: title,
      textStyle: _textStyle.copyWith(color: resolvedTextColor),
      textAlign: TextAlign.center,
    );

    if (icon != null) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon!,
            height: _textStyle.fontSize! + 4,
            // color: resolvedTextColor,
          ),
          const SizedBox(width: 10),
          content,
        ],
      );
    }

    Widget button = Container(
      decoration: BoxDecoration(
        color: isInverted || isDisabled
            ? resolvedBgColor
            : backgroundColor, // 👈 use solid color when provided

        gradient: (!isInverted && !isDisabled && backgroundColor == null)
            ? const LinearGradient(
                colors: [Color(0xFFFFA2C7), Color(0xFFF964A0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,

        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: ElevatedButton(
        onPressed: (isDisabled || isLoading) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding:  EdgeInsets.symmetric(vertical: height ?? 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(color: Colors.white),
              )
            : content, // ✅ FIXED
      ),
    );

    if (size == AppButtonSize.fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
