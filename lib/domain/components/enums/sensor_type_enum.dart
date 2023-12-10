import 'package:fabric_assets_tree_structure/domain/components/interfaces/sensor_type_enum_interface.dart';

enum SensorTypeEnum implements ISensorTypeEnum{
  vibration('vibration'),
  energy('energy'),
  notFound('');

  @override
  final String sensorType;

  const SensorTypeEnum(this.sensorType);

  factory SensorTypeEnum.fromType(String? type) {
    try {
      if(type == null) return SensorTypeEnum.notFound;
      return values.firstWhere((element) => element.sensorType == type);
    } catch (e) {
      return SensorTypeEnum.notFound;
    }
  }


}
