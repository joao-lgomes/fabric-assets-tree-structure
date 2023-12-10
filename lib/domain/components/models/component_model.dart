import 'package:fabric_assets_tree_structure/data/entities/asset_entity.dart';
import 'package:fabric_assets_tree_structure/domain/components/enums/component_status_enum.dart';
import 'package:fabric_assets_tree_structure/domain/components/enums/sensor_type_enum.dart';
import 'package:fabric_assets_tree_structure/domain/components/interfaces/component_model_interface.dart';

class ComponentModel implements IComponentModel {
  @override
  final String id;
  @override
  final String name;
  @override
  final String? parentId;
  @override
  final String? locationId;
  @override
  final SensorTypeEnum sensorType;
  @override
  final ComponentStatusEnum status;


  const ComponentModel({required this.id,
    required this.name,
    required this.sensorType,
    required this.status,
    this.parentId,
    this.locationId});

  factory ComponentModel.fromEntity(AssetEntity entity) {
    return ComponentModel(
      id: entity.id,
      name: entity.name,
      parentId: entity.parentId,
      locationId: entity.locationId,
      sensorType: SensorTypeEnum.fromType(entity.sensorType),
      status: ComponentStatusEnum.fromStatus(entity.status),
    );
  }
}
