import 'package:social_kit_example/screens/entry/basic_carousel_entry.screen.dart';
import 'package:social_kit_example/screens/entry/round_carousel_entry.screen.dart';
import 'package:social_kit_example/screens/entry/wave_carousel_entry.screen.dart';
import 'package:social_kit_example/screens/home/home.screen.dart';
import 'package:social_kit_example/screens/setting/setting.screen.dart';
import 'package:social_kit_example/screens/sleep_walker/sleep_walker.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_kit_example/screens/text_box/text_box.screen.dart';
import 'package:social_kit_example/screens/theme/comic.theme.screen.dart';
import 'package:social_kit_example/screens/theme/default.theme.screen.dart';
import 'package:social_kit_example/screens/theme/sleek.theme.screen.dart';

/// 1. Apply to MaterialApp
/// return MaterialApp.router(
///   routerConfig: router,
/// );
///
/// 2. Connect to global key
/// class _RootAppState extends State<RootApp> {
///   void initState() {
///      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
///        globalNavigatorKey = router.routerDelegate.navigatorKey;
///      });
///   }
/// }

late final GlobalKey<NavigatorState> globalNavigatorKey;
BuildContext get globalContext => globalNavigatorKey.currentContext!;

/// GoRouter
final router = GoRouter(
  // redirect: (context, state) {
  //   if (state.fullPath == EntryScreen.routeName) {
  //     return null;
  //   } else {
  //     if ('loggedIn' != 'loggedIn') {
  //       return EntryScreen.routeName;
  //     } else {
  //       return null;
  //     }
  //   }
  // },
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: WaveCarouselEntryScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const WaveCarouselEntryScreen(),
      ),
    ),
    GoRoute(
      path: RoundCarouselEntryScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const RoundCarouselEntryScreen(),
      ),
    ),
    GoRoute(
      path: BasicCarouselEntryScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const BasicCarouselEntryScreen(),
      ),
    ),
    GoRoute(
      path: SleepWalkerScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SleepWalkerScreen(),
      ),
    ),
    GoRoute(
      path: CommicThemeScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const CommicThemeScreen(),
      ),
    ),
    GoRoute(
      path: SleekThemeScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SleekThemeScreen(),
      ),
    ),
    GoRoute(
      path: DefaultThemeScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const DefaultThemeScreen(),
      ),
    ),
    GoRoute(
      path: SettingScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SettingScreen(),
      ),
    ),
    GoRoute(
      path: TextBoxScreen.routeName,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const TextBoxScreen(),
      ),
    ),
  ],
);
