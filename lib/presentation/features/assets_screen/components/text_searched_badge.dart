import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_typography.dart';
import 'package:fabric_assets_tree_structure/presentation/features/unit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextSearchedBadge extends StatelessWidget {
  final String textSearched;

  const TextSearchedBadge({super.key, required this.textSearched});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<UnitViewModel>(context, listen: false)
            .removeSearch(textSearched);
      },
      child: Container(
        decoration: BoxDecoration(
          color: TractColors.primary,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textSearched,
                style: TypoReg.body_3
                    .copyWith(color: TractColors.white, height: 1),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 4, top: 1),
                child: Icon(
                  Icons.clear,
                  color: TractColors.white,
                  size: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
