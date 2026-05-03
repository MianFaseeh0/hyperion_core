import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();

  static const BoxShadow subtle = BoxShadow(
    color: Colors.black12,
    blurRadius: 6,
    offset: Offset(0, 2),
  );

  static const BoxShadow soft = BoxShadow(
    color: Colors.black26,
    blurRadius: 10,
    offset: Offset(0, 4),
  );

  static const BoxShadow medium = BoxShadow(
    color: Colors.black38,
    blurRadius: 14,
    offset: Offset(0, 6),
  );

  static const BoxShadow strong = BoxShadow(
    color: Colors.black45,
    blurRadius: 20,
    offset: Offset(0, 8),
  );

  static const List<BoxShadow> card = [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> elevated = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 18,
      offset: Offset(0, 8),
    ),
  ];
}
