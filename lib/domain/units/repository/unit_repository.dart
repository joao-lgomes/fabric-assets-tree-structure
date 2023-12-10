import 'package:fabric_assets_tree_structure/data/entities/asset_entity.dart';
import 'package:fabric_assets_tree_structure/data/entities/location_entity.dart';
import 'package:fabric_assets_tree_structure/data/services/get_assets_service.dart';
import 'package:fabric_assets_tree_structure/data/services/get_locations_service.dart';
import 'package:fabric_assets_tree_structure/data/services/get_units_service.dart';
import 'package:fabric_assets_tree_structure/domain/assets/models/asset_model.dart';
import 'package:fabric_assets_tree_structure/domain/locations/models/location_model.dart';
import 'package:fabric_assets_tree_structure/domain/units/models/unit_model.dart';

class UnitRepository {
  final GetUnitsService _getUnitsService;
  final GetLocationsService _getLocationsService;
  final GetAssetsService _getAssetsService;

  UnitRepository(
      {required GetUnitsService getUnitsService,
      required GetAssetsService getAssetsService,
      required GetLocationsService getLocationsService})
      : _getUnitsService = getUnitsService,
        _getAssetsService = getAssetsService,
        _getLocationsService = getLocationsService;

  Future<List<UnitModel>> getUnits({required String location}) async {
    return (await _getUnitsService.readJson(jsonLocation: location))
        .map((unit) => UnitModel.fromEntity(unit))
        .toList(growable: false);
  }

  Future<UnitModel> getUnitAssets({required UnitModel unit}) async {
    final unitAllData = await Future.wait([
      _getLocationsService.readJson(
          jsonLocation: '${unit.directoryLocation}/locations.json'),
      _getAssetsService.readJson(
          jsonLocation: '${unit.directoryLocation}/assets.json'),
    ]);

    final List<AssetModel> allAssetModels =
        (unitAllData[1] as List<AssetEntity>)
            .map((assetEntity) =>
                AssetModel.fromEntity(assetEntity, assetChildren: []))
            .toList(growable: false);
    List<LocationModel> allLocationModels =
        (unitAllData[0] as List<LocationEntity>)
            .map((locationEntity) => LocationModel.fromEntity(locationEntity,
                locationsChildren: [], assetsChildren: []))
            .toList(growable: false);

    for (var asset in allAssetModels) {
      asset.assetChildren.addAll(
        allAssetModels.where((child) => child.parentId == asset.id),
      );
    }

    for (var location in allLocationModels) {
      location.locationsChildren.addAll(
        allLocationModels.where((child) => child.parentId == location.id),
      );
      location.assetsChildren.addAll(
        allAssetModels.where((asset) => asset.locationId == location.id),
      );
    }

    return UnitModel.fromChildren(
      unit,
      locationsChildren: allLocationModels
          .where((location) => location.parentId == null)
          .toList(growable: false),
      assetsChildren: allAssetModels
          .where((asset) => asset.parentId == null && asset.locationId == null)
          .toList(growable: false),
    );
  }
}
