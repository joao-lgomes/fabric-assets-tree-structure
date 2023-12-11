import 'package:fabric_assets_tree_structure/data/entities/unit_entity.dart';
import 'package:fabric_assets_tree_structure/domain/units/interfaces/unit_model_interface.dart';

class UnitModel implements IUnitModel {
  @override
  final String name;
  @override
  final String directoryLocation;

  const UnitModel({required this.name, required this.directoryLocation});

  factory UnitModel.fromEntity(UnitEntity entity) {
    return UnitModel(
        name: entity.name, directoryLocation: entity.directoryLocation);
  }
}
