import 'package:fabric_assets_tree_structure/domain/units/models/unit_model.dart';
import 'package:fabric_assets_tree_structure/presentation/features/home_screen/components/unit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<UnitModel> units = [
    const UnitModel(
        name: "Unit test 1", directoryLocation: 'assets/data/unit1'),
    const UnitModel(
        name: "Unit test 2", directoryLocation: 'assets/data/unit2'),
  ];

  group('OnSelectUnit', () {
    testWidgets(
        '[OnSelectUnit] [Check if function onUnitSelected is working] [should be the directoryLocation of the unit clicked]',
        (tester) async {
      String unitDirectoryLocation = '';

      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: UnitCard(
              unit: units[0],
              onUnitSelected: (unit) {
                unitDirectoryLocation = unit.directoryLocation;
              },
            ),
          ),
        ),
      ));

      await tester.tap(find.byKey(Key(units[0].name)));
      await tester.pumpAndSettle();

      expect(unitDirectoryLocation, 'assets/data/unit1');
    });
  });
}
