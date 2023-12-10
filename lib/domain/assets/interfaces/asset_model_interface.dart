import 'package:fabric_assets_tree_structure/domain/components/interfaces/component_model_interface.dart';
import 'package:fabric_assets_tree_structure/domain/components/interfaces/component_status_enum_interface.dart';
import 'package:fabric_assets_tree_structure/domain/components/interfaces/sensor_type_enum_interface.dart';

abstract class IAssetModel {
  String get id;

  String get name;

  String? get parentId;

  String? get locationId;

  List<IAssetModel> get assetChildren;

  // List<IComponentModel> get componentChildren;

  ISensorTypeEnum? get sensorType;

  IComponentStatusEnum? get status;
}
