import 'package:flutter/material.dart';
import 'package:social_kit/social_kit.dart';

class SleepWalkerScreen extends StatefulWidget {
  static const String routeName = '/SleepWalker';
  const SleepWalkerScreen({super.key});

  @override
  State<SleepWalkerScreen> createState() => _SleepWalkerScreenState();
}

class _SleepWalkerScreenState extends State<SleepWalkerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SleepWalker'),
      ),
      body: Stack(
        children: [
          const Text("SleepWalker"),
          SleepWalker(
            repeat: true,
            alignments: const [
              (
                alignment: Alignment.topLeft,
                duration: Duration(milliseconds: 2000),
              ),
              (
                alignment: Alignment.topRight,
                duration: Duration(milliseconds: 700),
              ),
              (
                alignment: Alignment.bottomRight,
                duration: Duration(milliseconds: 400),
              ),
              (
                alignment: Alignment.bottomLeft,
                duration: Duration(milliseconds: 300),
              ),
              (
                alignment: Alignment(.7, .2),
                duration: Duration(milliseconds: 200),
              ),
              (
                alignment: Alignment(-1, -1),
                duration: Duration(seconds: 1),
              ),
            ],
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
