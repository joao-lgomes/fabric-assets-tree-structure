import 'package:fabric_assets_tree_structure/domain/assets/interfaces/component_data_interface.dart';
import 'package:flutter/material.dart';

class ComponentDataModel implements IComponentDataInterface {
  @override
  final String text;

  @override
  final String description;

  @override
  final IconData icon;

  @override
  final Color color;

  @override
  final bool isType;

  const ComponentDataModel(
      {required this.text,
      required this.description,
      required this.icon,
      required this.color,
      required this.isType});
}
