import 'package:fabric_assets_tree_structure/domain/locations/models/location_model.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/images_enum.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_typography.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/widgets/trac_image.dart';
import 'package:fabric_assets_tree_structure/presentation/features/assets_screen/components/asset_tree_widget.dart';
import 'package:fabric_assets_tree_structure/presentation/features/unit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationTreeWidget extends StatefulWidget {
  final LocationModel location;
  final bool initializeExpanded;

  const LocationTreeWidget(
      {super.key, required this.location, this.initializeExpanded = true});

  @override
  State<LocationTreeWidget> createState() => _LocationTreeWidgetState();
}

class _LocationTreeWidgetState extends State<LocationTreeWidget> {
  late bool _isExpanded;

  @override
  void initState() {
    _isExpanded = widget.initializeExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<UnitViewModel>(context)
            .verifyLocationtIsInFilter(widget.location)
        ? Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Row(
                    children: [
                      widget.location.locationsChildren.isNotEmpty ||
                              widget.location.assetsChildren.isNotEmpty
                          ? Icon(
                              _isExpanded
                                  ? Icons.arrow_downward
                                  : Icons.arrow_forward,
                              size: 15,
                              color: TractColors.secondary,
                            )
                          : const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: SizedBox.shrink(),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4),
                        child:
                            TractImage.asset(TractImages.location, height: 22),
                      ),
                      Text(widget.location.name,
                          style: TypoReg.body_3
                              .copyWith(color: TractColors.secondary)),
                    ],
                  ),
                ),
                Visibility(
                  visible: _isExpanded,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      children: [
                        for (var location in widget.location.locationsChildren)
                          LocationTreeWidget(
                            location: location,
                          ),
                        for (var asset in widget.location.assetsChildren)
                          AssetTreeWidget(
                            asset: asset,
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
