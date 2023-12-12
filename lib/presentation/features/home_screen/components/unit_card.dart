import 'package:fabric_assets_tree_structure/domain/units/models/unit_model.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/images_enum.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_typography.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/widgets/trac_image.dart';
import 'package:flutter/material.dart';

class UnitCard extends StatelessWidget {
  final UnitModel unit;
  final void Function(UnitModel unit) onUnitSelected;

  const UnitCard({super.key, required this.unit, required this.onUnitSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        key: Key(unit.name),
        onTap: () => onUnitSelected(unit),
        child: Container(
          decoration: BoxDecoration(
            color: TractColors.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                TractImage.asset(TractImages.unit, height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(unit.name,
                      style: TypoSemiBold.subheading_2
                          .copyWith(color: TractColors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
