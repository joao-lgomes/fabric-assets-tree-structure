import 'package:fabric_assets_tree_structure/domain/assets/interfaces/component_status_enum_interface.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:flutter/material.dart';

enum ComponentStatusEnum implements IComponentStatusEnum {
  alert('alert', 'Em alerta', Icons.error, TractColors.danger),
  operating('operating', 'Em operação', Icons.check_circle, TractColors.text2),
  notFound('', 'Not Found', Icons.report_problem, TractColors.danger);

  @override
  final String text;
  @override
  final String description;
  @override
  final IconData icon;
  @override
  final Color color;
  @override
  final bool isType = false;

  const ComponentStatusEnum(this.text, this.description, this.icon, this.color);

  factory ComponentStatusEnum.fromStatus(String? status) {
    try {
      if (status == null) return ComponentStatusEnum.notFound;
      return values.firstWhere((element) => element.text == status);
    } catch (e) {
      return ComponentStatusEnum.notFound;
    }
  }
}
