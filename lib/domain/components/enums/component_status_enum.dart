import 'package:fabric_assets_tree_structure/domain/components/interfaces/component_status_enum_interface.dart';

enum ComponentStatusEnum implements IComponentStatusEnum{
  operating('operating'),
  alert('alert'),
  notFound('');

  @override
  final String status;

  const ComponentStatusEnum(this.status);

  factory ComponentStatusEnum.fromStatus(String? status) {
    try {
      if(status == null) return ComponentStatusEnum.notFound;
      return values.firstWhere((element) => element.status == status);
    } catch (e) {
      return ComponentStatusEnum.notFound;
    }
  }


}
