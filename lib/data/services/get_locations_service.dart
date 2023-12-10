import 'dart:convert';

import 'package:fabric_assets_tree_structure/data/entities/location_entity.dart';
import 'package:flutter/services.dart';

class GetLocationsService {
  Future<List<LocationEntity>> readJson({required String jsonLocation}) async {
    final String locationsJsonString =
        await rootBundle.loadString(jsonLocation);
    final locationsJson = await json.decode(locationsJsonString) as List;
    return locationsJson
        .map((location) => LocationEntity.fromJson(location))
        .toList(growable: false);
  }
}
