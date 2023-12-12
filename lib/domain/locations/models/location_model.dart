import 'package:fabric_assets_tree_structure/data/entities/location_entity.dart';
import 'package:fabric_assets_tree_structure/domain/assets/models/asset_model.dart';
import 'package:fabric_assets_tree_structure/domain/locations/interfaces/location_model_interface.dart';

class LocationModel implements ILocationModel {
  @override
  final String id;
  @override
  final String name;
  @override
  final String? parentId;
  @override
  final List<LocationModel> locationsChildren;
  @override
  final List<AssetModel> assetsChildren;

  const LocationModel(
      {required this.id,
      required this.name,
      required this.assetsChildren,
      required this.locationsChildren,
      this.parentId});

  factory LocationModel.fromEntity(
    LocationEntity entity, {
    required List<LocationModel> locationsChildren,
    required List<AssetModel> assetsChildren,
  }) {
    return LocationModel(
      id: entity.id,
      name: entity.name,
      parentId: entity.parentId,
      locationsChildren: locationsChildren,
      assetsChildren: assetsChildren,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'parentId': parentId,
    };
  }
}
