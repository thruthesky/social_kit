import 'package:flutter/material.dart';
import 'package:social_kit_example/screens/theme/theme.body.dart';

class DefaultThemeScreen extends StatefulWidget {
  static const String routeName = '/DefaultTheme';
  const DefaultThemeScreen({super.key});

  @override
  State<DefaultThemeScreen> createState() => _DefaultThemeScreenState();
}

class _DefaultThemeScreenState extends State<DefaultThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Default Theme Design'),
      ),
      body: const ThemeBody(),
    );
  }
}
