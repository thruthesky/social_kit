import 'package:flutter/material.dart';
import 'package:social_kit/social_kit.dart';
import 'package:social_kit_example/screens/theme/theme.body.dart';

class SleekThemeScreen extends StatefulWidget {
  static const String routeName = '/SleekTheme';
  const SleekThemeScreen({super.key});

  @override
  State<SleekThemeScreen> createState() => _SleekThemeScreenState();
}

class _SleekThemeScreenState extends State<SleekThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: sleekTheme(context: context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sleek Theme Design'),
        ),
        body: const ThemeBody(),
      ),
    );
  }
}
