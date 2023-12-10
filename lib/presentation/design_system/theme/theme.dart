import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getTheme(TextTheme textTheme) {
  return ThemeData(
    colorSchemeSeed: TractColors.primary,
    fontFamily: Fonts.primaryFont,
    useMaterial3: true,
    scaffoldBackgroundColor: TractColors.white,
    cardTheme: const CardTheme(
        color: TractColors.white,
        surfaceTintColor: TractColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.5,
            color: TractColors.g100,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        )),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: TractColors.white),
    dialogTheme: const DialogTheme(
      backgroundColor: TractColors.white,
      surfaceTintColor: TractColors.white,
    ),
    dividerColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      titleTextStyle: TypoSemiBold.subheading_2.copyWith(color: TractColors.white),
      backgroundColor: TractColors.secondary,
      surfaceTintColor: TractColors.primary,
      shadowColor: TractColors.primary.withOpacity(0.15),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 1, color: TractColors.g200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 1, color: TractColors.secondary),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 1, color: TractColors.danger),
      ),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(width: 1, color: TractColors.g200)),
    ),
    indicatorColor: TractColors.secondary,
    unselectedWidgetColor: TractColors.p200,
    textTheme: GoogleFonts.montserratTextTheme(textTheme).copyWith(
      bodySmall: TypoReg.body_1.copyWith(color: TractColors.secondary),
      bodyMedium: TypoReg.body_2.copyWith(color: TractColors.secondary),
      bodyLarge: TypoReg.body_3.copyWith(color: TractColors.secondary),
      displayLarge: TypoReg.display_2.copyWith(color: TractColors.secondary),
      displayMedium: TypoReg.display_1.copyWith(color: TractColors.secondary),
      labelLarge: TypoReg.body_3.copyWith(color: TractColors.secondary),
      labelMedium: TypoReg.body_2.copyWith(color: TractColors.secondary),
      labelSmall: TypoReg.body_1.copyWith(color: TractColors.secondary),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: TractColors.p200,
      cursorColor: TractColors.primary,
      selectionHandleColor: TractColors.primary,
    ),
    buttonTheme: const ButtonThemeData(buttonColor: TractColors.primary, textTheme: ButtonTextTheme.primary),
  );
}
