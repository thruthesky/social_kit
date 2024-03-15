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
    return const Scaffold(
      body: RoundCarouselEntry(),
    );
  }
}
