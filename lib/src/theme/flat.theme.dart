import 'package:flutter/material.dart';

ThemeData flatTheme({
  required BuildContext context,
  ColorScheme? colorScheme,
}) {
  colorScheme ??= ColorScheme.fromSeed(seedColor: Colors.blue).copyWith(
    surface: Colors.indigo.shade50,
    surfaceVariant: Colors.indigo.shade100.withAlpha(160),
    outline: Colors.indigo.shade300,
  );
  return ThemeData(
    colorScheme: colorScheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: colorScheme.secondary,
        backgroundColor: colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.16),
        ),
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              letterSpacing: -.1,
            ),
      ),
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: Theme.of(context).colorScheme.onSurface.withAlpha(5),
    //   floatingLabelStyle: Theme.of(context).textTheme.labelLarge,
    //   floatingLabelBehavior: FloatingLabelBehavior.always,
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(16.16),
    //     borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(16.16),
    //     borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface),
    //   ),
    //   disabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(16.16),
    //   ),
    //   border: const OutlineInputBorder(
    //     borderSide: BorderSide(color: Colors.transparent),
    //   ),
    // ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w300,
      ),
    ),
    dividerTheme: DividerThemeData(
      thickness: 1,
      space: 0,
      color: colorScheme.surfaceVariant,
    ),
    cardTheme: CardTheme(
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        // side: BorderSide(
        //   color: Theme.of(context).colorScheme.onSurface.withOpacity(.3),
        // ),
      ),
    ),
    // listTileTheme: Theme.of(context).listTileTheme.copyWith(
    //       minVerticalPadding: 10,
    //       contentPadding: const EdgeInsets.symmetric(
    //         vertical: 0,
    //         horizontal: 20,
    //       ),
    //       tileColor: colorScheme.surfaceVariant,
    //       visualDensity: VisualDensity.compact,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(20),
    //       ),
    //     ),
    useMaterial3: true,
  );
}
