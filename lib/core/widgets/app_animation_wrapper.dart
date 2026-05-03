import 'package:flutter/material.dart';
import 'dart:math';

enum AppAnimationType {
  appearFromBottom,
  appearFromTop,
  appearFromLeftToRight,
  appearFromRightToLeft,
  fadeIn,
  scale,
  floating,
}

class AppAnimationWrapper extends StatefulWidget {
  final Widget child;
  final AppAnimationType animationType;
  final Duration duration;
  final Curve curve;
  final double offset;
  final double amplitude; // 🔥 for floating

  const AppAnimationWrapper({
    super.key,
    required this.child,
    this.animationType = AppAnimationType.appearFromBottom,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOut,
    this.offset = 0.1,
    this.amplitude = 3, // default subtle movement
  });

  @override
  State<AppAnimationWrapper> createState() => _AppAnimationWrapperState();
}

class _AppAnimationWrapperState extends State<AppAnimationWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Offset _getBeginOffset() {
    switch (widget.animationType) {
      case AppAnimationType.appearFromBottom:
        return Offset(0, widget.offset);
      case AppAnimationType.appearFromTop:
        return Offset(0, -widget.offset);
      case AppAnimationType.appearFromLeftToRight:
        return Offset(-widget.offset, 0);
      case AppAnimationType.appearFromRightToLeft:
        return Offset(widget.offset, 0);
      default:
        return Offset.zero;
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    if (widget.animationType == AppAnimationType.floating) {
      _controller.repeat(); // infinite loop
    } else {
      _controller.forward(); // one-time animation
    }
  }

  @override
  Widget build(BuildContext context) {
    final beginOffset = _getBeginOffset();

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, childWidget) {
        double value = widget.animationType == AppAnimationType.floating
            ? _controller.value
            : CurvedAnimation(parent: _controller, curve: widget.curve).value;

        // 🔹 Floating movement
        if (widget.animationType == AppAnimationType.floating) {
          final dx = sin(value * 2 * pi) * widget.amplitude;
          final dy = cos(value * 2 * pi) * widget.amplitude;

          return Transform.translate(
            offset: Offset(dx, dy),
            child: childWidget,
          );
        }

        // 🔹 Slide
      final slideOffset = Offset(
  beginOffset.dx * (1 - value) * 50,
  beginOffset.dy * (1 - value) * 50,
);

        // 🔹 Fade
        double opacity = value;

        // 🔹 Scale (bounce)
        double scale = 1.0;
        if (widget.animationType == AppAnimationType.scale) {
          scale = 0.8 + (0.2 * value);
        }

        return Opacity(
          opacity: opacity.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: widget.animationType == AppAnimationType.scale
                ? Offset.zero
                : slideOffset,
            child: Transform.scale(scale: scale, child: childWidget),
          ),
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}  