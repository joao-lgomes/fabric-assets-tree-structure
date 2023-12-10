import 'package:fabric_assets_tree_structure/data/interfaces/location_entity_interface.dart';

class LocationEntity implements ILocationEntity {
  @override
  final String id;
  @override
  final String name;
  @override
  final String? parentId;

  const LocationEntity(
      {required this.id,
        required this.name,
      this.parentId});

  factory LocationEntity.fromJson(Map<String, dynamic> json) {
    return LocationEntity(
      id: json['id'],
      name: json['name'],
      parentId: json['parentId']
    );
  }
}
