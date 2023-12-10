import 'dart:convert';

import 'package:fabric_assets_tree_structure/data/entities/unit_entity.dart';
import 'package:flutter/services.dart';

class GetUnitsService {
  Future<List<UnitEntity>> readJson({required String jsonLocation}) async {
    final String unitsJsonString = await rootBundle.loadString(jsonLocation);
    final unitsJson = await json.decode(unitsJsonString) as List;
    final teste = unitsJson
        .map((unit) => UnitEntity.fromJson(unit))
        .toList(growable: false);
    return teste;
  }
}
