import 'package:fabric_assets_tree_structure/data/interfaces/unit_entity_interface.dart';

class UnitEntity implements IUnitEntity {
  @override
  final String name;
  @override
  final String directoryLocation;

  const UnitEntity({required this.name, required this.directoryLocation});

  factory UnitEntity.fromJson(Map<String, dynamic> json) {
    return UnitEntity(
        name: json['name'], directoryLocation: json['directoryLocation']);
  }
}
