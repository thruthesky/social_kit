import 'package:flutter/material.dart';
import 'package:social_kit/social_kit.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = '/Setting';
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: const Column(
        children: [
          CardListView(
            textStyle: Theme.of(context).textTheme.bodySmall,
            items: [
              CardListTile(
                label: 'My profile',
                trailing: Icon(
                  Icons.person,
                  size: 20,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('My profile'),
                    ),
                  );
                },
              ),
              CardListTile(
                label: 'View my public profile',
                trailing: Icon(
                  Icons.lock_open,
                  size: 20,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('View my public profile'),
                    ),
                  );
                },
              ),
              CardListTile(
                label: 'Whatever menu you like',
                trailing: Icon(
                  Icons.whatshot,
                  size: 20,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Whatever menu you like'),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
