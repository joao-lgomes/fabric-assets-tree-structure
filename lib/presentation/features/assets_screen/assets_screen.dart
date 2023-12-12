import 'package:fabric_assets_tree_structure/domain/units/models/unit_model.dart';
import 'package:fabric_assets_tree_structure/domain/units/models/unit_with_children_model.dart';
import 'package:fabric_assets_tree_structure/domain/units/repository/unit_repository.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_typography.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/widgets/app_bar.dart';
import 'package:fabric_assets_tree_structure/presentation/features/assets_screen/assets_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssetsScreen extends StatelessWidget {
  final UnitModel unit;

  const AssetsScreen({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TractAppBar(
        titleAppBar: 'Assets',
        colorBackButton: TractColors.white,
        hasCenterTitle: true,
      ),
      body: FutureBuilder<UnitWithChildrenModel>(
          future: Provider.of<UnitRepository>(context, listen: false)
              .getUnitAssets(unit: unit),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(color: TractColors.primary),
              );
            }
            if (snapshot.hasError) {
              return Text(
                "Ocorreu um erro, tente novamente mais tarde.",
                style:
                    TypoMed.subheading_2.copyWith(color: TractColors.secondary),
              );
            }
            return AssetsScreenContent(unit: snapshot.data!);
          }),
    );
  }
}
