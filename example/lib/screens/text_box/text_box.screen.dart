import 'package:flutter/material.dart';
import 'package:social_kit/social_kit.dart';

class TextBoxScreen extends StatefulWidget {
  static const String routeName = '/TextBox';
  const TextBoxScreen({super.key});

  @override
  State<TextBoxScreen> createState() => _TextBoxScreenState();
}

class _TextBoxScreenState extends State<TextBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextBox'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ComicTextBox(
              title: Text(
                'This is ComicTextBox',
              ),
              content: Text(
                'ComicTextBox Content',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
