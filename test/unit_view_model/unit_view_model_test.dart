import 'package:fabric_assets_tree_structure/data/services/get_assets_service.dart';
import 'package:fabric_assets_tree_structure/data/services/get_locations_service.dart';
import 'package:fabric_assets_tree_structure/data/services/get_units_service.dart';
import 'package:fabric_assets_tree_structure/domain/units/models/unit_model.dart';
import 'package:fabric_assets_tree_structure/domain/units/models/unit_with_children_model.dart';
import 'package:fabric_assets_tree_structure/domain/units/repository/unit_repository.dart';
import 'package:fabric_assets_tree_structure/presentation/features/unit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  UnitViewModel setupViewModel() {
    final GetUnitsService getUnitsService = GetUnitsService();
    final GetLocationsService getLocationsService = GetLocationsService();
    final GetAssetsService getAssetsService = GetAssetsService();
    final UnitRepository repository = UnitRepository(
        getUnitsService: getUnitsService,
        getAssetsService: getAssetsService,
        getLocationsService: getLocationsService);
    return UnitViewModel(repository: repository);
  }

  group("[UNIT_VIEW_MODEL]", () {
    WidgetsFlutterBinding.ensureInitialized();
    test(
        "[UNIT_VIEW_MODEL] [Check function getUnits] [should represents the units test of JSON file]",
        () async {
      final viewModel = setupViewModel();

      final List<UnitModel> testUnits = await viewModel.getUnits(
          location: 'test/unit_view_model/units_test.json');

      expect(testUnits.length, 3);
      expect(testUnits[0].name, 'Apex Unit');
      expect(testUnits[1].name, 'Jaguar Unit');
      expect(testUnits[2].name, 'Tobias Unit');
    });

    test("[NPS_VIEW_MODEL] [Check skipNps NPS] [should be true]", () async {
      final viewModel = setupViewModel();

      final UnitWithChildrenModel testUnit = await viewModel.getUnitAssets(
          unit: const UnitModel(
              name: 'unit test',
              directoryLocation: 'test/unit_view_model/unit_test_files'));

      expect(testUnit.name, 'unit test');
      expect(testUnit.numberOfAssetsAndLocations, 13);
      expect(testUnit.locationsChildren.length, 3);
      expect(testUnit.assetsChildren.length, 1);
    });
  });
}
