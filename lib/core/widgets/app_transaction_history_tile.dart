import 'package:flutter/material.dart';

import '../../core.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import 'app_text_widget.dart';

class AppTransactionHistoryTile extends StatelessWidget {
  String transactionTitle;
  bool isAscending;
  String transactionAmount;

  AppTransactionHistoryTile({
    super.key,
    required this.transactionTitle,
    required this.isAscending,
    required this.transactionAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppThemes.sheetBg.withOpacity(0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  data: transactionTitle,
                  textStyle: AppTextStyles.bodySemiBold,
                ),
                Row(
                  spacing: 4,
                  children: [
                    isAscending
                        ? Icon(
                            EvaIcons.plus_outline,
                            size: 12,
                            color: Colors.green,
                          )
                        : Icon(
                            EvaIcons.minus_outline,
                            size: 12,
                            color: Colors.red,
                          ),
                    AppTextWidget(
                      data: transactionAmount,
                      textStyle: AppTextStyles.body,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isAscending
                    ? Colors.green.withOpacity(0.2)
                    : Colors.redAccent.withOpacity(0.2),
              ),
              child: isAscending
                  ? Icon(EvaIcons.trending_up_outline, color: Colors.green)
                  : Icon(EvaIcons.trending_down_outline, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
