import 'package:fabric_assets_tree_structure/data/services/get_assets_service.dart';
import 'package:fabric_assets_tree_structure/data/services/get_locations_service.dart';
import 'package:fabric_assets_tree_structure/data/services/get_units_service.dart';
import 'package:fabric_assets_tree_structure/domain/units/repository/unit_repository.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/theme.dart';
import 'package:fabric_assets_tree_structure/presentation/features/home_screen/home_screen.dart';
import 'package:fabric_assets_tree_structure/presentation/features/unit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
      providers: [
        Provider(create: (context) => GetLocationsService()),
        Provider(create: (context) => GetAssetsService()),
        Provider(create: (context) => GetUnitsService()),
        Provider(
            create: (context) => UnitRepository(
                  getLocationsService:
                      Provider.of<GetLocationsService>(context, listen: false),
                  getAssetsService:
                      Provider.of<GetAssetsService>(context, listen: false),
                  getUnitsService:
                      Provider.of<GetUnitsService>(context, listen: false),
                )),
        ChangeNotifierProvider(
            create: (context) => UnitViewModel(
                  repository:
                      Provider.of<UnitRepository>(context, listen: false),
                )),
      ],
      child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp(
            title: 'Fabric Assets',
            theme: getTheme(textTheme),
            home: const HomeScreen(),
          )),
    );
  }
}
