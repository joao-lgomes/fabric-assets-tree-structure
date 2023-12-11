import 'package:fabric_assets_tree_structure/domain/components/interfaces/component_data_interface.dart';
import 'package:flutter/material.dart';

abstract class ISensorTypeEnum implements IComponentDataInterface {
  @override
  String get text;

  @override
  String get description;

  @override
  IconData get icon;

  @override
  Color get color;

  @override
  bool get isType;
}
