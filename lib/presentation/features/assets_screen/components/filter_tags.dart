import 'package:fabric_assets_tree_structure/domain/components/models/component_data_model.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_typography.dart';
import 'package:flutter/material.dart';

class FilterTags extends StatelessWidget {
  final ComponentDataModel filter;
  final void Function() onTap;
  final bool isSelected;

  const FilterTags(
      {super.key,
      required this.filter,
      required this.onTap,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? filter.color : TractColors.white,
          border: Border.all(color: filter.color, width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Icon(
                filter.icon,
                size: 17,
                color: isSelected ? TractColors.white : filter.color,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  filter.description,
                  style: TypoMed.body_3.copyWith(
                      color: isSelected ? TractColors.white : filter.color),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
