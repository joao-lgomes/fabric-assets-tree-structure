import 'package:fabric_assets_tree_structure/data/interfaces/asset_entity_interface.dart';

class AssetEntity implements IAssetEntity {
  @override
  final String id;
  @override
  final String name;
  @override
  final String? parentId;
  @override
  final String? locationId;
  @override
  final String? sensorType;
  @override
  final String? status;

  const AssetEntity(
      {required this.id,
        required this.name,
        this.parentId,
        this.locationId,
        this.sensorType,
        this.status
      });

  factory AssetEntity.fromJson(Map<String, dynamic> json) {
    return AssetEntity(
        id: json['id'],
        name: json['name'],
        parentId: json['parentId'],
        locationId: json['locationId'],
        sensorType: json['sensorType'],
        status: json['status'],
    );
  }
}
