import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'app_text_widget.dart';

class AppValueTile extends StatelessWidget {
  IconData iconData;
  String title;

  AppValueTile(this.iconData, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppThemes.sheetBg,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,

          spacing: 10,
          children: [
            Icon(iconData, size: 14),
            AppTextWidget(data: title),
          ],
        ),
      ),
    );
  }
}
