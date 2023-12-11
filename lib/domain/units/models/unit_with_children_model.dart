import 'package:fabric_assets_tree_structure/domain/assets/models/asset_model.dart';
import 'package:fabric_assets_tree_structure/domain/locations/models/location_model.dart';
import 'package:fabric_assets_tree_structure/domain/units/interfaces/unit_with_children_model_interface.dart';
import 'package:fabric_assets_tree_structure/domain/units/models/unit_model.dart';

class UnitWithChildrenModel extends UnitModel
    implements IUnitWithChildrenModel {
  @override
  final List<LocationModel> locationsChildren;
  @override
  final List<AssetModel> assetsChildren;

  const UnitWithChildrenModel(
      {required super.name,
      required super.directoryLocation,
      required this.assetsChildren,
      required this.locationsChildren});

  factory UnitWithChildrenModel.fromChildren(
    UnitModel model, {
    required List<LocationModel> locationsChildren,
    required List<AssetModel> assetsChildren,
  }) {
    return UnitWithChildrenModel(
      name: model.name,
      directoryLocation: model.directoryLocation,
      locationsChildren: locationsChildren,
      assetsChildren: assetsChildren,
    );
  }
}
