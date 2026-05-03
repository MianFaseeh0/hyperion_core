import 'package:flutter/material.dart';

import '../../core.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import 'app_text_widget.dart';

class AppMenuTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  bool isDeletion;

  AppMenuTile({required this.title, required this.onTap, this.isDeletion = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppThemes.sheetBg,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children: [
              AppTextWidget(data: title, textStyle: isDeletion ? AppTextStyles.body.copyWith(color: Colors.red) : AppTextStyles.body),
              Icon(EvaIcons.arrow_ios_forward_outline, color: isDeletion ? Colors.red : Colors.black,),
            ],
          ),
        ),
      ),
    );
  }
}
