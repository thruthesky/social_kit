import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundCarouselEntry extends StatefulWidget {
  static const String routeName = '/entry';
  const RoundCarouselEntry({super.key});

  @override
  State<RoundCarouselEntry> createState() => _RoundCarouselEntryState();
}

class _RoundCarouselEntryState extends State<RoundCarouselEntry> {
  bool hasAgree = false;

  TextStyle get titleLarge => Theme.of(context).textTheme.titleLarge!;
  TextStyle get titleMedium => Theme.of(context).textTheme.titleMedium!;
  TextStyle get labelMedium => Theme.of(context).textTheme.labelMedium!;
  TextStyle get labelSmall => Theme.of(context).textTheme.labelSmall!;

  Size get mediaQuery => MediaQuery.of(context).size;

  final double md = 24;
  final double fsXs = 10;
  final double fsLg = 32;
  final spaceXs = const SizedBox(width: 8);
  final spaceSm = const SizedBox(width: 16);
  final spaceLg = const SizedBox(width: 32);

  @override
  void initState() {
    super.initState();

    // scheduleMicrotask(() async {
    //   PackageInfo packageInfo = await PackageInfo.fromPlatform();

    //   String appName = packageInfo.appName;
    //   String packageName = packageInfo.packageName;
    //   String version = packageInfo.version;
    //   String buildNumber = packageInfo.buildNumber;

    //   print(" appName: $appName, packageName: $packageName, version: $version, buildNumber: $buildNumber");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(600),
            bottomRight: Radius.circular(140),
          ),
          child: SizedBox(
            width: double.infinity,
            height: mediaQuery.height * 0.75,
            child: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=90',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0),
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: md, top: md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('App Name'),
                    Text(
                      'Connect With Coaches And Players',
                      style: labelMedium.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(left: md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          key: const Key('EntryAgreeCheckbox'),
                          value: hasAgree,
                          onChanged: (value) {
                            setState(() => hasAgree = !hasAgree);
                          },
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        spaceXs,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 14),
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () =>
                                    setState(() => hasAgree = !hasAgree),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AutoSizeText(
                                      'Do you agree to the terms and conditions?',
                                      maxLines: 1,
                                      minFontSize: fsXs,
                                      maxFontSize: fsLg,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceTint,
                                        letterSpacing: 0.05,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    spaceXs,
                                  ],
                                ),
                              ),
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'View the terms and conditions',
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    spaceXs,
                                    Text(
                                      key: const Key('EntryTermsAndConditions'),
                                      'View the terms and conditions',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground
                                                .withAlpha(150),
                                            letterSpacing: 0.4,
                                          ),
                                    ),
                                    spaceSm,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      // need to review what is the best way to size the space
                      padding: const EdgeInsets.only(left: 47.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          print('onPressed');
                        },
                        child: const Text('Login with Phone Number'),
                      ),
                    ),
                    SafeArea(child: spaceLg),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
