import 'package:fabric_assets_tree_structure/domain/components/interfaces/sensor_type_enum_interface.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:flutter/material.dart';

enum SensorTypeEnum implements ISensorTypeEnum {
  energy('energy', 'Sensor de energia', Icons.electric_bolt, Color(0xff4ab019),
      TractColors.energy),
  vibration('vibration', 'Sensor de vibração', Icons.vibration,
      Color(0xff1b69c4), TractColors.primary),
  notFound(
      '', 'Not Found', Icons.error, TractColors.danger, TractColors.danger);

  @override
  final String text;
  @override
  final String description;
  @override
  final IconData icon;
  @override
  final Color color;
  @override
  final bool isType = true;
  final Color componentIconColor;

  const SensorTypeEnum(this.text, this.description, this.icon, this.color,
      this.componentIconColor);

  factory SensorTypeEnum.fromType(String? type) {
    try {
      if (type == null) return SensorTypeEnum.notFound;
      return values.firstWhere((element) => element.text == type);
    } catch (e) {
      return SensorTypeEnum.notFound;
    }
  }
}
