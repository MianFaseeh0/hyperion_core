import 'package:flutter/widgets.dart';

extension SpacingExtension on num {
  /// Returns a SizedBox with the given height
  /// Usage: 20.h
  SizedBox get h => SizedBox(height: toDouble());

  /// Returns a SizedBox with the given width
  /// Usage: 20.w
  SizedBox get w => SizedBox(width: toDouble());

  /// Returns a SizedBox with both height and width (square)
  /// Usage: 20.wh
  SizedBox get wh => SizedBox(height: toDouble(), width: toDouble());
}