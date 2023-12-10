import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:flutter/material.dart';

class TractAppBar extends AppBar {
  final String titleAppBar;
  final Widget? titleWidget;
  final Color? colorBackButton;
  final bool? hasCenterTitle;

  TractAppBar(
      {super.key,
      this.titleAppBar = '',
      this.titleWidget,
      this.colorBackButton,
      super.backgroundColor,
      this.hasCenterTitle = false})
      : super(
            iconTheme:
                IconThemeData(color: colorBackButton ?? TractColors.black),
            title: (titleAppBar.isEmpty)
                ? TitleWidgetAppbar(titleWidget)
                : Text(titleAppBar),
            centerTitle: hasCenterTitle,
            titleSpacing: 8);
}

class TitleWidgetAppbar extends StatelessWidget {
  final Widget? titleWidget;

  const TitleWidgetAppbar(this.titleWidget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return titleWidget ?? const SizedBox.shrink();
  }
}
