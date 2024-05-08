import 'package:flutter/material.dart';

ThemeData comicTheme({
  required BuildContext context,
  ColorScheme? colorScheme,
}) {
  colorScheme ??= ColorScheme.fromSeed(seedColor: Colors.blue);

  return ThemeData(
    colorScheme: colorScheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: colorScheme.secondary,
        backgroundColor: colorScheme.background,
        elevation: 0,
        side: BorderSide(
          color: colorScheme.secondary,
          width: 1.8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.16),
        ),
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              letterSpacing: -.1,
            ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: colorScheme.secondary,
          width: 1.8,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.onSurface.withAlpha(5),
      floatingLabelStyle: Theme.of(context).textTheme.labelLarge,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.16),
        borderSide: BorderSide(
          color: colorScheme.onSurface,
          width: 2.4,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.16),
        borderSide: BorderSide(
          color: colorScheme.onSurface.withAlpha(128),
          width: 1.8,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.16),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
    ),
    dividerTheme: DividerThemeData(
      thickness: 2,
      space: 0,
      color: colorScheme.secondary,
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: colorScheme.secondary,
          width: 1.6,
        ),
      ),
    ),
    // listTileTheme: Theme.of(context).listTileTheme.copyWith(
    //       minVerticalPadding: 10,
    //       contentPadding: const EdgeInsets.symmetric(
    //         vertical: 0,
    //         horizontal: 20,
    //       ),
    //       tileColor: colorScheme.surface,
    //       visualDensity: VisualDensity.compact,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(20),
    //         side: BorderSide(
    //           color: colorScheme.secondary,
    //           width: 2,
    //         ),
    //       ),
    //     ),
    useMaterial3: true,
  );
}
