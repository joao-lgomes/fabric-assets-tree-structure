import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_typography.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/widgets/button/button_size.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/widgets/button/button_type.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages

class TractButton extends StatelessWidget {
  final String text;
  final ButtonSize size;
  final Widget? iconLeft;
  final Widget? iconRight;
  final void Function() function;
  final Color color;
  final Color disabledColor;
  final ButtonType type;
  static const double iconSpacing = 11.0;
  static const double borderRadius = 8.0;
  final bool isEnable;
  final TextStyle? typographyStyle;

  const TractButton(
      {required this.text,
      required this.function,
      this.iconLeft,
      this.iconRight,
      this.isEnable = true,
      this.size = ButtonSize.normal,
      super.key,
      this.color = TractColors.primary,
      this.disabledColor = TractColors.g200,
      this.type = ButtonType.elevated,
      this.typographyStyle});

  @override
  Widget build(BuildContext context) {
    TextStyle fontStyle = typographyStyle ?? TypoSemiBold.body_3;
    final Widget buttonChild = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildIconLeft(),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: fontStyle.copyWith(color: _colorFont()),
            ),
          ),
          buildIconRight(),
        ],
      ),
    );

    setIsEnabled() {
      if (isEnable == false) {
        return null;
      } else {
        return function;
      }
    }

    return type == ButtonType.textButton
        ? TextButton(
            onPressed: setIsEnabled(),
            style: textButtonStyle(),
            child: buttonChild)
        : SizedBox(
            height: size.height,
            child: type == ButtonType.outlined
                ? OutlinedButton(
                    style: outlinedButtonStyle(),
                    onPressed: setIsEnabled(),
                    child: buttonChild,
                  )
                : ElevatedButton(
                    style: elevatedButtonStyle(),
                    onPressed: setIsEnabled(),
                    child: buttonChild),
          );
  }

  Color _colorFont() {
    if (type == ButtonType.elevated) {
      if (isEnable) {
        return TractColors.white;
      } else {
        return TractColors.g500;
      }
    }
    return color;
  }

  textButtonStyle() {
    return TextButton.styleFrom(
      textStyle: TextStyle(fontSize: size.height, color: color),
    );
  }

  outlinedButtonStyle() {
    return OutlinedButton.styleFrom(
        side: BorderSide(color: color, width: 2),
        disabledBackgroundColor: disabledColor,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: const BorderSide(width: 2)));
  }

  elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: EdgeInsets.zero,
      elevation: 0,
      disabledBackgroundColor: disabledColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }

  Widget buildIconLeft() {
    if (iconLeft != null) {
      return Padding(
        padding: const EdgeInsets.only(right: iconSpacing),
        child: iconLeft,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget buildIconRight() {
    if (iconRight != null) {
      return Padding(
        padding: const EdgeInsets.only(left: iconSpacing),
        child: iconRight,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
