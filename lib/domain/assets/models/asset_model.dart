import 'package:fabric_assets_tree_structure/data/entities/asset_entity.dart';
import 'package:fabric_assets_tree_structure/domain/assets/enums/component_status_enum.dart';
import 'package:fabric_assets_tree_structure/domain/assets/enums/sensor_type_enum.dart';
import 'package:fabric_assets_tree_structure/domain/assets/interfaces/asset_model_interface.dart';

class AssetModel implements IAssetModel {
  @override
  final String id;
  @override
  final String name;
  @override
  final String? parentId;
  @override
  final String? locationId;
  @override
  final SensorTypeEnum? sensorType;
  @override
  final ComponentStatusEnum? status;
  @override
  final List<AssetModel> assetChildren;
  @override
  final bool isComponent;

  const AssetModel({
    required this.id,
    required this.name,
    required this.assetChildren,
    required this.isComponent,
    this.status,
    this.sensorType,
    this.parentId,
    this.locationId,
  });

  factory AssetModel.fromEntity(
    AssetEntity entity, {
    required List<AssetModel> assetChildren,
  }) {
    return AssetModel(
      id: entity.id,
      name: entity.name,
      parentId: entity.parentId,
      locationId: entity.locationId,
      assetChildren: assetChildren,
      sensorType: entity.sensorType != null
          ? SensorTypeEnum.fromType(entity.sensorType)
          : null,
      status: entity.status != null
          ? ComponentStatusEnum.fromStatus(entity.status)
          : null,
      isComponent: entity.sensorType != null && entity.status != null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'parentId': parentId,
      'locationId': locationId,
      'sensorType': sensorType?.text,
      'status': status?.text,
    };
  }
}
