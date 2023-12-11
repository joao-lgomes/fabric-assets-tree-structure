import 'package:fabric_assets_tree_structure/domain/units/models/unit_with_children_model.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_typography.dart';
import 'package:fabric_assets_tree_structure/presentation/features/assets_screen/components/asset_tree_widget.dart';
import 'package:fabric_assets_tree_structure/presentation/features/assets_screen/components/filter_tags.dart';
import 'package:fabric_assets_tree_structure/presentation/features/assets_screen/components/location_tree_widget.dart';
import 'package:fabric_assets_tree_structure/presentation/features/assets_screen/components/search_widget.dart';
import 'package:fabric_assets_tree_structure/presentation/features/assets_screen/components/text_searched_badge.dart';
import 'package:fabric_assets_tree_structure/presentation/features/unit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssetsScreenContent extends StatelessWidget {
  final UnitWithChildrenModel unit;

  const AssetsScreenContent({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    final TextEditingController editingController = TextEditingController();

    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: TractColors.g200,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ativos da unidade ${unit.name}:",
                                  style: TypoSemiBold.title
                                      .copyWith(color: TractColors.secondary)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                    "Filtre utilizando a barra de busca ou filtros abaixo:",
                                    style: TypoReg.body_4),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SearchWidget(editingController, 40),
                        ),
                        Provider.of<UnitViewModel>(context, listen: false)
                                .searchList
                                .isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, bottom: 4),
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 4,
                                  children: Provider.of<UnitViewModel>(context,
                                          listen: false)
                                      .searchList
                                      .map((search) => TextSearchedBadge(
                                          textSearched: search))
                                      .toList(),
                                ),
                              )
                            : const SizedBox.shrink(),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0, left: 16),
                          child: SizedBox(
                            height: 35,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: Provider.of<UnitViewModel>(context)
                                    .getTags(location: unit.directoryLocation)
                                    .map((tag) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4.0),
                                        child: FilterTags(
                                          filter: tag,
                                          onTap: () {
                                            Provider.of<UnitViewModel>(context,
                                                    listen: false)
                                                .clickFilter(tag);
                                          },
                                          isSelected:
                                              (Provider.of<UnitViewModel>(
                                                      context)
                                                  .verifyFilterIsSelected(tag)),
                                        )))
                                    .toList()),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      for (var location in unit.locationsChildren)
                        LocationTreeWidget(
                          location: location,
                        ),
                      for (var asset in unit.assetsChildren)
                        AssetTreeWidget(
                          asset: asset,
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
