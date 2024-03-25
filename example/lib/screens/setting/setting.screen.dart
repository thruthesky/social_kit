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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Commic Theme Design'),
            Theme(
              data: comicTheme(context: context),
              child: const SettingItems(),
            ),
            const SizedBox(height: 24),
            const Text('Sleek Theme Design'),
            Theme(
              data: sleekTheme(context: context),
              child: const SettingItems(),
            ),
            const SizedBox(height: 24),
            const Text('Flat Theme Design'),
            Theme(
              data: flatTheme(context: context).copyWith(
                cardTheme: flatTheme(context: context).cardTheme.copyWith(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.3),
                        ),
                      ),
                    ),
              ),
              child: const SettingItems(
                divider: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingItems extends StatelessWidget {
  const SettingItems({
    super.key,
    this.divider = const SizedBox(height: 7),
  });

  final Widget? divider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardListView(
          divider: divider,
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          sublabelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
          children: [
            CardListTile(
              label: 'Language',
              sublabel: 'English',
              leading: const Icon(
                Icons.language,
                size: 20,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('My language ...'),
                  ),
                );
              },
            ),
            CardListTile(
              label: 'Change password',
              leading: const Icon(
                Icons.lock_open,
                size: 20,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Change password....'),
                  ),
                );
              },
            ),
            CardListTile(
              label: 'Notifications',
              leading: const Icon(
                Icons.notifications,
                size: 20,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Whatever notifications ...'),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
