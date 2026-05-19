import 'package:flutter/material.dart';

enum PaddingLevel { none, small, medium, large }

class AppScaffoldWidget extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final bool scrollable;
  final Color? backgroundColor;
  final EdgeInsets? customPadding;
  final PaddingLevel paddingLevel;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool resizeToAvoidBottomInset;
  final bool canLooseFocusOnTapOutside;
  final bool safeAreaTop;
    final bool safeAreaBottom;
        final bool extendBodyBehindAppbar;


  const AppScaffoldWidget({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.customPadding,
    this.scrollable = false,
    this.paddingLevel = PaddingLevel.medium,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset = true,
    this.canLooseFocusOnTapOutside = false,
    this.safeAreaTop=true,
    this.safeAreaBottom=true,
    this.extendBodyBehindAppbar=false
    
  });


  EdgeInsets _getPadding() {
    if (customPadding != null) return customPadding!;
    switch (paddingLevel) {
      case PaddingLevel.none:
        return EdgeInsets.zero;
      case PaddingLevel.small:
        return const EdgeInsets.all(8);
      case PaddingLevel.medium:
        return const EdgeInsets.all(16);
      case PaddingLevel.large:
        return const EdgeInsets.all(24);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = body ?? const SizedBox();

    // Make scrollable if needed (before adding padding and SafeArea)
    if (scrollable) {
      content = SingleChildScrollView(
        child: Padding(
          padding: _getPadding(),
          child: content,
        ),
      );
    } else {
      content = Padding(
        padding: _getPadding(),
        child: content,
      );
    }

    content = SafeArea(
      top: safeAreaTop,
      bottom:safeAreaBottom ,
      child: content);

    if (canLooseFocusOnTapOutside) {
      content = GestureDetector(
        onTap: () {
          // Get the primary focus
          final FocusScopeNode currentFocus = FocusScope.of(context);
          // Only unfocus if there's a focused widget but it's not primary focus
          // This prevents interfering with keyboard navigation
          if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        behavior: HitTestBehavior.opaque,
        child: content,
      );
    }

    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar:extendBodyBehindAppbar ,
      drawer: drawer,
      endDrawer: endDrawer,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: content,
    );
  }
}