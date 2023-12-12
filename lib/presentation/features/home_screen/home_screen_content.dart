import 'package:fabric_assets_tree_structure/domain/units/models/unit_model.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_typography.dart';
import 'package:fabric_assets_tree_structure/presentation/features/home_screen/components/unit_card.dart';
import 'package:flutter/material.dart';

class HomeScreenContent extends StatelessWidget {
  final List<UnitModel> units;
  final void Function(UnitModel unit) onUnitSelected;

  const HomeScreenContent({super.key,
    required this.units,
    required this.onUnitSelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 4),
              child: Text("Unidades",
                  style: TypoSemiBold.title
                      .copyWith(color: TractColors.secondary)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text("Selecione a unidade que deseja acessar:",
                  style: TypoReg.subheading_2),
            ),
            for (var unit in units)
              UnitCard(
                unit: unit,
                onUnitSelected: onUnitSelected,
              )
          ],
        ),
      ),
    );
  }
}
