import 'package:fabric_assets_tree_structure/domain/assets/interfaces/asset_model_interface.dart';

abstract class ILocationModel {
  String get id;

  String get name;

  String? get parentId;

  List<ILocationModel> get locationsChildren;

  List<IAssetModel> get assetsChildren;
}
