import 'package:fabric_assets_tree_structure/domain/assets/enums/component_status_enum.dart';
import 'package:fabric_assets_tree_structure/domain/assets/models/asset_model.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/images_enum.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_typography.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/widgets/trac_image.dart';
import 'package:fabric_assets_tree_structure/presentation/features/unit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssetTreeWidget extends StatefulWidget {
  final AssetModel asset;
  final bool initializeExpanded;

  const AssetTreeWidget(
      {super.key, required this.asset, this.initializeExpanded = true});

  @override
  State<AssetTreeWidget> createState() => _AssetTreeWidgetState();
}

class _AssetTreeWidgetState extends State<AssetTreeWidget> {
  late bool _isExpanded;

  @override
  void initState() {
    _isExpanded = widget.initializeExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<UnitViewModel>(context)
            .verifyAssetIsInFilter(widget.asset)
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
                      widget.asset.assetChildren.isNotEmpty
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
                        child: TractImage.asset(
                            widget.asset.isComponent
                                ? TractImages.component
                                : TractImages.asset,
                            height: 20),
                      ),
                      Flexible(
                        child: RichText(
                            text: TextSpan(
                                text: widget.asset.name,
                                style: TypoReg.body_3
                                    .copyWith(color: TractColors.secondary),
                                children: componentIcons(widget.asset))),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: _isExpanded && widget.asset.assetChildren.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.asset.assetChildren
                            .map((asset) => AssetTreeWidget(
                                  asset: asset,
                                  initializeExpanded: widget.initializeExpanded,
                                ))
                            .toList(growable: false)),
                  ),
                )
              ],
            ))
        : const SizedBox.shrink();
  }

  List<InlineSpan>? componentIcons(final AssetModel asset) {
    if (asset.isComponent) {
      return [
        WidgetSpan(
            child: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Icon(widget.asset.sensorType!.icon,
              size: 17, color: widget.asset.sensorType!.componentIconColor),
        )),
        WidgetSpan(
          child: widget.asset.status == ComponentStatusEnum.alert
              ? Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Icon(widget.asset.status!.icon,
                      size: 17, color: widget.asset.status!.color),
                )
              : const SizedBox.shrink(),
        )
      ];
    } else {
      return null;
    }
  }
}
