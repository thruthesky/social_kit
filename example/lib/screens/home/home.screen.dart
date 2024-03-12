import 'package:social_kit_example/screens/entry/entry.screen.dart';
import 'package:social_kit_example/screens/sleep_walker/sleep_walker.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Social Kit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.push(EntryScreen.routeName),
              child: const Text('Wave Carousel Entry Screen'),
            ),
            ElevatedButton(
              onPressed: () => context.push(SleepWalkerScreen.routeName),
              child: const Text('Sleep Walker'),
            ),
          ],
        ),
      ),
    );
  }
}
