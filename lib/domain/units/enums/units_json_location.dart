enum UnitsJsonLocations {
  apex(1, 'Apex Unit', 'assets/data/apex_unit/locations.json',
      'assets/data/apex_unit/assets.json'),
  jaguar(3, 'Jaguar Unit', 'assets/data/jaguar_unit/locations.json',
      'assets/data/jaguar_unit/assets.json'),
  tobias(5, 'Tobias Unit', 'assets/data/tobias_unit/locations.json',
      'assets/data/tobias_unit/assets.json'),
  notFound(0, 'error', '', '');

  final int id;
  final String unit;
  final String locationsJson;
  final String assetsJson;

  const UnitsJsonLocations(
      this.id, this.unit, this.locationsJson, this.assetsJson);

  factory UnitsJsonLocations.fromLocation(String unit) {
    try {
      return values.firstWhere((element) => element.unit == unit);
    } catch (e) {
      return UnitsJsonLocations.notFound;
    }
  }
}
