import 'package:flutter/cupertino.dart';

class AppTextWidget extends StatelessWidget {
  String data;
  bool? softWrap;
  TextOverflow? overflow;
  int? maxLines;
  TextStyle? textStyle;
  TextAlign? textAlign;

  AppTextWidget({
    super.key,
    required this.data,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.textStyle,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}
