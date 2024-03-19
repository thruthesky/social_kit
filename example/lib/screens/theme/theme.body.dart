import 'package:flutter/material.dart';
import 'package:social_kit/social_kit.dart';

class ThemeBody extends StatelessWidget {
  const ThemeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text("ElevatedButton"),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('ElevatedButton'),
                  ),
                );
              },
              child: const Text('ElevatedButton'),
            ),
            const Text("CommicTheme"),
            CardListItems(
              textStyle: Theme.of(context).textTheme.bodySmall,
              items: [
                CardListItem(
                  label: 'My profile',
                  trailing: const Icon(
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
                CardListItem(
                  label: 'View my public profile',
                  trailing: const Icon(
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
                CardListItem(
                  label: 'Whatever menu you like',
                  trailing: const Icon(
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
            const Text("ListTile"),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My profile'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('My profile'),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.lock_open),
              title: const Text('View my public profile'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('View my public profile'),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.whatshot),
              title: const Text('Whatever menu you like'),
              trailing: const Icon(Icons.arrow_forward_ios),
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
      ),
    );
  }
}
