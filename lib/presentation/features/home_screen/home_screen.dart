import 'package:fabric_assets_tree_structure/domain/units/models/unit_model.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/images_enum.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/widgets/app_bar.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/widgets/trac_image.dart';
import 'package:fabric_assets_tree_structure/presentation/features/assets_screen/assets_screen.dart';
import 'package:fabric_assets_tree_structure/presentation/features/home_screen/home_screen_content.dart';
import 'package:fabric_assets_tree_structure/presentation/features/unit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TractAppBar(
        titleWidget: TractImage.asset(TractImages.logo, height: 17),
        hasCenterTitle: true,
      ),
      body: FutureBuilder<List<UnitModel>>(
          future: Provider.of<UnitViewModel>(context, listen: false)
              .getUnits(location: 'assets/data/units.json'),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const SizedBox.shrink();
            }
            if (snapshot.hasError) {
              return const SizedBox.shrink();
            }
            return HomeScreenContent(
                units: snapshot.data!,
                onUnitSelected: (UnitModel unit) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssetsScreen(unit: unit)));
                });
          }),
    );
  }
}
