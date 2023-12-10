import 'package:fabric_assets_tree_structure/data/entities/unit_entity.dart';
import 'package:fabric_assets_tree_structure/domain/assets/models/asset_model.dart';
import 'package:fabric_assets_tree_structure/domain/locations/interfaces/location_model_interface.dart';
import 'package:fabric_assets_tree_structure/domain/units/interfaces/unit_model_interface.dart';

class UnitModel implements IUnitModel {
  @override
  final String name;
  @override
  final String directoryLocation;
  @override
  final List<ILocationModel> locationsChildren;
  @override
  final List<AssetModel> assetsChildren;

  const UnitModel({required this.name,
    required this.directoryLocation,
    required this.assetsChildren,
    required this.locationsChildren});

  factory UnitModel.fromEntity(UnitEntity entity) {
    return UnitModel(
      name: entity.name,
      directoryLocation: entity.directoryLocation,
      locationsChildren: [],
      assetsChildren: [],
    );
  }

  factory UnitModel.fromChildren(UnitModel model, {
    required List<ILocationModel> locationsChildren,
    required List<AssetModel> assetsChildren,
  }) {
    return UnitModel(
      name: model.name,
      directoryLocation: model.directoryLocation,
      locationsChildren: locationsChildren,
      assetsChildren: assetsChildren,
    );
  }
}
