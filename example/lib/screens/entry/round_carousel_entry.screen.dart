import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_kit/social_kit.dart';

class RoundCarouselEntryScreen extends StatefulWidget {
  static const String routeName = '/RoundCarouselEntryScreen';
  const RoundCarouselEntryScreen({super.key});

  @override
  State<RoundCarouselEntryScreen> createState() =>
      _RoundCarouselEntryScreenState();
}

class _RoundCarouselEntryScreenState extends State<RoundCarouselEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RoundCarouselEntry(
        autoSwipeInterval: 3000,
        bottomStroke: 8,
        bottomStrokeColor: Colors.grey,
        titleSpacing: 16,
        start: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('CONTINUE'),
        ),
        items: [
          (
            title: Text(
              "Casual Talk",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            subtitle: Text(
              "Please join casual and enjoyable conversations with potential matches using our meeting app. Easily connect and chat.",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.grey.shade200,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            image: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=90',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: Text(
              "Extends Social Circle",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            subtitle: Text(
              "Discover interesting individuals to connect with. Our meeting app makes it easy to broaden your horizons and meet diverse people.",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.grey.shade200,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            image: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=100',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: Text(
              "Discover New Connections",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            subtitle: Text(
              "Our meeting app is designed to help you find new connections and expand your social circle. Join us and meet new people.",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.grey.shade200,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            image: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=110',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: Text(
              "Meaningful Connections",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            subtitle: Text(
              "Create meaningful connections through honest conversations. Our app fosters a friendly and welcoming environment for meeting potential partners.",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.grey.shade200,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            image: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=120',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
