import 'package:fabric_assets_tree_structure/domain/units/models/unit_model.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/images_enum.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_typography.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/widgets/button/button_size.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/widgets/button/tract_button.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/widgets/trac_image.dart';
import 'package:flutter/material.dart';

class HomeScreenContent extends StatelessWidget {
  final List<UnitModel> units;
  final void Function(UnitModel unit) onUnitSelected;
  final void Function() onClickNewUnit;

  const HomeScreenContent(
      {super.key,
      required this.units,
      required this.onUnitSelected,
      required this.onClickNewUnit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 4),
                    child: Text("UNIDADES",
                        style: TypoSemiBold.title
                            .copyWith(color: TractColors.secondary)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text("Selecione a unidade que deseja acessar:",
                        style: TypoReg.body_4),
                  ),
                  for (var unit in units)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: TractColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            children: [
                              TractImage.asset(TracImages.unit, height: 24),
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
                    )
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: TractColors.g200,
                width: 2,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TractButton(
                text: "Cadastrar nova unidade",
                typographyStyle:
                    TypoSemiBold.body_4.copyWith(color: TractColors.white),
                iconLeft: const Icon(Icons.add, color: TractColors.white),
                size: ButtonSize.large,
                function: onClickNewUnit),
          ),
        )
      ],
    );
  }
}
