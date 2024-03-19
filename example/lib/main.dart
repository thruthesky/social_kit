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
    );
  }
}
