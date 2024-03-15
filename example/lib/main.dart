import 'package:flutter/material.dart';
import 'package:social_kit/social_kit.dart';
import 'package:social_kit_example/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: comicTheme(context: context).copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: comicTheme(context: context).colorScheme.secondary,
            backgroundColor:
                comicTheme(context: context).colorScheme.background,
            elevation: 0,
            side: BorderSide(
              color: comicTheme(context: context).colorScheme.secondary,
              width: 1.8,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.16),
            ),
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
          ),
        ),
      ),
    );
  }
}
