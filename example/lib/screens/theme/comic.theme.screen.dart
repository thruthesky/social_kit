import 'package:flutter/material.dart';
import 'package:social_kit/social_kit.dart';
import 'package:social_kit_example/screens/theme/theme.body.dart';

class CommicThemeScreen extends StatefulWidget {
  static const String routeName = '/CommicTheme';
  const CommicThemeScreen({super.key});

  @override
  State<CommicThemeScreen> createState() => _CommicThemeScreenState();
}

class _CommicThemeScreenState extends State<CommicThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: comicTheme(context: context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CommicTheme'),
        ),
        body: const ThemeBody(),
      ),
    );
  }
}
