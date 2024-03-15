import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_kit/social_kit.dart';

class EntryScreen extends StatefulWidget {
  static const String routeName = '/Entry';
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WaveCarouselEntry(
        bottomStroke: 4,
        bottomStrokeColor: Colors.blue,
        titleSpacing: 0,
        start: ElevatedButton(
            onPressed: () {
              // print('tapped');
              Navigator.pop(context);
            },
            child: const Text('Start')),
        logo: Container(
          width: 72,
          height: 72,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFffe1f1),
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250/',
              fit: BoxFit.cover,
            ),
          ),
        ),
        items: [
          (
            title: const Text("Casual Talk"),
            subtitle: const Text(
                "Please join casual and enjoyable conversations with potential matches using our meeting app. Easily connect and chat."),
            image: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=9',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: const Text("Extends Social Circle"),
            subtitle: const Text(
                "Discover interesting individuals to connect with. Our meeting app makes it easy to broaden your horizons and meet diverse people."),
            image: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=10',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: const Text("Discover New Connections"),
            subtitle: const Text(
                "Our meeting app is designed to help you find new connections and expand your social circle. Join us and meet new people."),
            image: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=11',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: const Text("Meaningful Connections"),
            subtitle: const Text(
                "Create meaningful connections through honest conversations. Our app fosters a friendly and welcoming environment for meeting potential partners."),
            image: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=12',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
