import 'dart:convert';

import 'package:fabric_assets_tree_structure/data/entities/asset_entity.dart';
import 'package:flutter/services.dart';

class GetAssetsService {
  Future<List<AssetEntity>> readJson({required String jsonLocation}) async {
    final String assetsJsonString = await rootBundle.loadString(jsonLocation);
    final assetsJson = await json.decode(assetsJsonString) as List;
    return assetsJson.map((asset) => AssetEntity.fromJson(asset)).toList(growable: false);
  }
}
