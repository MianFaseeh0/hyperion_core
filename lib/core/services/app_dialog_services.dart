import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../widgets/app_text_widget.dart';

class AppDialogService {
  static Future<bool> showConfirmationDialog({
    required BuildContext context,
    required String confirmationText,
    String? title,
    String yesText = 'Yes',
    String noText = 'No',
    Color? yesColor,
    Color? noColor,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: title != null
              ? AppTextWidget(data: title, textStyle: AppTextStyles.bodyBold)
              : null,
          content: AppTextWidget(
            data: confirmationText,
            textStyle: AppTextStyles.body,
          ),
          contentPadding: EdgeInsets.fromLTRB(
            24,
            title != null ? 20 : 24,
            24,
            0,
          ),
          actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              style: TextButton.styleFrom(
                foregroundColor: noColor ?? Colors.grey[600],
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: AppTextWidget(
                data: noText,
                textStyle: AppTextStyles.body,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: TextButton.styleFrom(
                foregroundColor: yesColor ?? AppThemes.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: AppTextWidget(
                data: yesText,
                textStyle: AppTextStyles.body,
              ),
            ),
          ],
        );
      },
    );

    // Return false if dialog was dismissed (result is null)
    return result ?? false;
  }
}
