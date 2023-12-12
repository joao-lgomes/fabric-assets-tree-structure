import 'package:fabric_assets_tree_structure/domain/assets/enums/component_status_enum.dart';
import 'package:fabric_assets_tree_structure/domain/assets/enums/sensor_type_enum.dart';
import 'package:fabric_assets_tree_structure/domain/assets/models/asset_model.dart';
import 'package:fabric_assets_tree_structure/domain/assets/models/component_data_model.dart';
import 'package:fabric_assets_tree_structure/domain/locations/models/location_model.dart';
import 'package:fabric_assets_tree_structure/domain/units/models/unit_model.dart';
import 'package:fabric_assets_tree_structure/domain/units/models/unit_with_children_model.dart';
import 'package:fabric_assets_tree_structure/domain/units/repository/unit_repository.dart';
import 'package:flutter/cupertino.dart';

class UnitViewModel extends ChangeNotifier {
  final UnitRepository repository;
  List<String> searchList = [];
  List<String> filtersStatus = [];
  List<String> filtersType = [];

  UnitViewModel({required this.repository});

  Future<List<UnitModel>> getUnits({required String location}) async {
    return await repository.getUnits(location: location);
  }

  Future<UnitWithChildrenModel> getUnitAssets({required UnitModel unit}) async {
    return await repository.getUnitAssets(unit: unit);
  }

  List<ComponentDataModel> getTags({required String location}) {
    final List<ComponentDataModel> tags = [];
    for (var sensorType in SensorTypeEnum.values) {
      if (sensorType.text != '') {
        tags.add(ComponentDataModel(
            icon: sensorType.icon,
            text: sensorType.text,
            description: sensorType.description,
            color: sensorType.color,
            isType: true));
      }
    }
    for (var status in ComponentStatusEnum.values) {
      if (status.text != '') {
        tags.add(ComponentDataModel(
            description: status.description,
            color: status.color,
            icon: status.icon,
            text: status.text,
            isType: false));
      }
    }
    return tags;
  }

  bool verifyAssetIsInFilter(AssetModel asset) {
    bool assetIsInSearch = false;
    for (var search in searchList) {
      if (asset.name.toLowerCase().contains(search.toLowerCase())) {
        assetIsInSearch = true;
        break;
      }
    }
    if (asset.isComponent) {
      return (filtersStatus.contains(asset.status!.text) ||
              filtersStatus.isEmpty) &&
          (filtersType.contains(asset.sensorType!.text) ||
              filtersType.isEmpty) &&
          (searchList.isEmpty || assetIsInSearch);
    } else {
      bool isInFilter = false;
      for (var child in asset.assetChildren) {
        isInFilter = verifyAssetIsInFilter(child);
        if (isInFilter) {
          return true;
        }
      }
    }
    return false;
  }

  bool verifyLocationtIsInFilter(LocationModel location) {
    bool assetIsInSearch = false;
    for (var search in searchList) {
      if (location.name.toLowerCase().contains(search.toLowerCase())) {
        assetIsInSearch = true;
        break;
      }
    }
    if (filtersStatus.isEmpty &&
        filtersType.isEmpty &&
        (searchList.isEmpty || assetIsInSearch)) {
      return true;
    }
    bool isInFilter = false;
    for (var child in location.assetsChildren) {
      isInFilter = verifyAssetIsInFilter(child);
      if (isInFilter) {
        return true;
      }
    }
    for (var child in location.locationsChildren) {
      isInFilter = verifyLocationtIsInFilter(child);
      if (isInFilter) {
        return true;
      }
    }
    return false;
  }

  bool verifyFilterIsSelected(ComponentDataModel filter) {
    if (filter.isType) {
      return filtersType.contains(filter.text);
    } else {
      return filtersStatus.contains(filter.text);
    }
  }

  void clickFilter(ComponentDataModel filter) {
    if (filter.isType) {
      final int indexFind =
          filtersType.indexWhere((element) => element == filter.text);
      if (indexFind == -1) {
        filtersType.add(filter.text);
      } else {
        filtersType.removeAt(indexFind);
      }
      notifyListeners();
    } else {
      final int indexFind =
          filtersStatus.indexWhere((element) => element == filter.text);
      if (indexFind == -1) {
        filtersStatus.add(filter.text);
      } else {
        filtersStatus.removeAt(indexFind);
      }
      notifyListeners();
    }
  }

  void addSearch(String search) {
    searchList.add(search);
    notifyListeners();
  }

  void removeSearch(String search) {
    searchList.remove(search);
    notifyListeners();
  }

  void clearFilters() {
    searchList.clear();
    filtersStatus.clear();
    filtersType.clear();
  }
}
