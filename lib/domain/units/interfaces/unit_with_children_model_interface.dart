import 'package:fabric_assets_tree_structure/domain/assets/interfaces/asset_model_interface.dart';
import 'package:fabric_assets_tree_structure/domain/locations/interfaces/location_model_interface.dart';

abstract class IUnitWithChildrenModel {
  String get name;

  String get directoryLocation;

  List<ILocationModel> get locationsChildren;

  List<IAssetModel> get assetsChildren;

  int get numberOfAssetsAndLocations;
}
