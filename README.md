# Social Kit

Beautiful UI Kit for soical like apps.


## Widgets

### WaveCarouselEntry

![WaveCarouseEntry](https://github.com/thruthesky/social_kit/blob/main/images/wave_carousel_entry.gif?raw=true)

- This displays an entry style widget. It does not have a scaffold. Meaning you can add it in a screen if you want.
- It is best fit on mobile size.



- `bottomStroke` is the width of the bottom line at the bottom of photos. Ex: 5
- `bottomStrokeColor` is the color of `bottomStroke`. Ex: Colors.blue


- `start` is the button at the very bottom to display "CONTINUE" OR "GET STARTED".
- `autoSwipleInterval` is the interval in ms to swipe next slide. It must be bigger than 100 to activate the auto swipe.


### Sleep Walker

- You can move around a widget in a stack. It is useful to give some decoration under the stack.

- The speed of the each move is set by the starting point of the `duration`. Meaning, the speed of the current position to next position is depends on the `duration` of the current position. So, the last `duration` is ignored.





```dart
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
```

- Use case; You may add a background that moves in a screen. Add a child widget that has some blurred shapes and rotatation.




### Combination of WaveCarouselEntry and SleepWalker

- You can give a decoration of SleepWalker to the background of WaveCarouselEntry.

```dart
import 'package:flutter/material.dart';
import 'package:roha/app.service.dart';
import 'package:roha/screens/entry/entry.background.dart';
import 'package:roha/screens/entry/phone_sign_in.screen.dart';
import 'package:social_kit/social_kit.dart';

class EntryScreen extends StatelessWidget {
  static const String routeName = '/Entry';
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WaveCarouselEntry(
        autoSwipeInterval: 3,
        onStart: () async {
          final re =
              await AppService.instance.displayTermsAndConditions(context);
          if (re == true && context.mounted) {
            showGeneralDialog(
              context: context,
              pageBuilder: ($, $$, $$$) => const PhoneSignInScreen(),
            );
          }
        },
        logo: Container(
          width: 72,
          height: 72,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFffe1f1),
          ),
          child: FractionallySizedBox(
            widthFactor: 1.4,
            heightFactor: 1.4,
            child: Image.asset(
              'assets/images/app_icon.webp',
              fit: BoxFit.cover,
            ),
          ),
        ),
        items: [
          (
            title: "캐주얼 대화",
            subtitle:
                "우리의 미팅 앱을 사용하여 이성과의 캐주얼하고 즐거운 대화에 참여하세요. 손쉽게 연결하고 채팅하세요.",
            image: Image.asset(
              'assets/images/entry_screen/0.webp',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: "소셜 서클 확장",
            subtitle:
                "새로운 사람들을 만나 소셜 서클을 손쉽게 확장하세요. 우리의 앱은 진정한 연결과 친근한 상호작용을 위해 디자인되었습니다.",
            image: Image.asset(
              'assets/images/entry_screen/1.webp',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: "새로운 연결 발견",
            subtitle:
                "흥미로운 개인들과 연결을 찾아보세요. 우리의 미팅 앱은 시야를 넓히고 다양한 사람들을 만나기 쉽게 만들어줍니다.",
            image: Image.asset(
              'assets/images/entry_screen/2.webp',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: "의미 있는 대화 즐기기",
            subtitle:
                "정직한 대화를 통해 의미 있는 연결을 만들어보세요. 우리의 앱은 이성을 만날 수 있는 친근하고 환영받는 환경을 조성합니다.",
            image: Image.asset(
              'assets/images/entry_screen/3.webp',
              fit: BoxFit.cover,
            ),
          ),
        ],
        bottomGradient: const SizedBox.shrink(),
        indicatorColor: Colors.grey.shade600,
        indicatorActiveColor: Colors.black,
        backgroundWidget: const SleepWalker(
          alignments: [
            (
              alignment: Alignment.centerLeft,
              duration: Duration(milliseconds: 2000),
            ),
            (
              alignment: Alignment(-.1, .35),
              duration: Duration(milliseconds: 2000),
            ),
            (
              alignment: Alignment(0, .39),
              duration: Duration(milliseconds: 2000),
            ),
            (
              alignment: Alignment(0.9, .2),
              duration: Duration(milliseconds: 1500),
            ),
            (
              alignment: Alignment(1, .3),
              duration: Duration(milliseconds: 1500),
            ),
            (
              alignment: Alignment(.8, .6),
              duration: Duration(milliseconds: 1400),
            ),
            (
              alignment: Alignment(.0, .85),
              duration: Duration(milliseconds: 1400),
            ),
            (
              alignment: Alignment(-.8, .5),
              duration: Duration(milliseconds: 1300),
            ),
            (
              alignment: Alignment(.7, .2),
              duration: Duration(milliseconds: 1200),
            ),
            (
              alignment: Alignment(.8, .1),
              duration: Duration(milliseconds: 1200),
            ),
            (
              alignment: Alignment(.7, .15),
              duration: Duration(milliseconds: 1200),
            ),
            (
              alignment: Alignment(-.1, .25),
              duration: Duration(milliseconds: 1200),
            ),
            (
              alignment: Alignment.centerLeft,
              duration: Duration(seconds: 1),
            ),
          ],
          repeat: true,
          child: EntryBackground(),
        ),
      ),
    );
  }
}
```


```dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EntryBackground extends StatelessWidget {
  const EntryBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 196,
      height: 196,
      child: Stack(
        children: [
          // 중앙, 빨간색
          Positioned(
            top: 80,
            left: 50,
            child: Transform(
              alignment: Alignment.topRight,
              transform: Matrix4.rotationZ(pi / 12), // rotateZ(-pi / 12.0),
              child: Container(
                width: 99.88,
                height: 99.88,
                decoration: ShapeDecoration(
                  color: Colors.red.withAlpha(1),
                  shape: const StarBorder.polygon(
                    sides: 3,
                    pointRounding: 0.5,
                  ),
                  shadows: [
                    BoxShadow(
                      color: Colors.red.shade900.withAlpha(71),
                      blurRadius: 384.4,
                      spreadRadius: 0.1,
                    ),
                  ],
                ),
              ).animate().fade().scale().rotate().then().rotate(
                    delay: .4.seconds,
                    duration: 2300.seconds,
                    begin: 100,
                    end: 0,
                  ),
            ),
          ),
          // 상단, 오렌지색
          Positioned(
            top: 0,
            left: 30,
            child: Transform(
              alignment: Alignment.topRight,
              transform: Matrix4.rotationZ(-pi / 7), // rotateZ(-pi / 12.0),
              child: Container(
                width: 99.88,
                height: 99.88,
                decoration: ShapeDecoration(
                  color: Colors.orange.withAlpha(1),
                  shape: const StarBorder.polygon(
                    sides: 3,
                    pointRounding: 0.5,
                  ),
                  shadows: [
                    BoxShadow(
                      color: Colors.orange.shade900.withAlpha(71),
                      blurRadius: 384.4,
                      spreadRadius: 0.1,
                    ),
                  ],
                ),
              ).animate().fade().scale().rotate().then().rotate(
                    delay: .4.seconds,
                    duration: 6000.seconds,
                    begin: 0,
                    end: 100,
                  ),
            ),
          ),

          /// 파랑, 하단
          Positioned(
            top: 90,
            left: 50,
            child: Transform(
              alignment: Alignment.topRight,
              transform: Matrix4.rotationZ(-pi / 5), // rotateZ(-pi / 12.0),
              child: Container(
                width: 99.88,
                height: 99.88,
                decoration: ShapeDecoration(
                  color: Colors.blue.withAlpha(1),
                  shape: const StarBorder.polygon(
                    sides: 3,
                    pointRounding: .9,
                  ),
                  shadows: [
                    BoxShadow(
                      color: Colors.blue.shade900.withAlpha(71),
                      blurRadius: 384.4,
                      spreadRadius: 12,
                    ),
                  ],
                ),
              ).animate().fade().scale().rotate().then().rotate(
                    delay: .4.seconds,
                    duration: 1900.seconds,
                    begin: 0,
                    end: 100,
                  ),
            ),
          ),
        ],
      ).animate().rotate().scale().then().rotate(
            delay: .4.seconds,
            duration: 1900.seconds,
            begin: 100,
            end: 0,
          ),
    );
  }
}
```




## Theming

### comicTheme

This is an opinionated comic book style theme.

- If you want to override the comic theme, you can try something like below.

```dart
import 'package:flutter/material.dart';
import 'package:social_kit/social_kit.dart';
import 'package:social_kit_example/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: comicTheme(context: context).copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: comicTheme(context: context).colorScheme.secondary,
            backgroundColor:
                comicTheme(context: context).colorScheme.background,
            elevation: 0,
            side: BorderSide(
              color: comicTheme(context: context).colorScheme.secondary,
              width: 1.8,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.16),
            ),
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
          ),
        ),
      ),
    );
  }
}
```


### bigElevatedButtonTheme

### elevatedButtonToListTileTheme




## Glance of Theme Settings

Sometimes it can be helpful to see at a glance how the theme of the current app (the app you are developing) is set. Copy the code below and paste it in your app. You will see the theme settings like TextTheme or ColorTheme. It is recommended to capture the screen during the development work and save it somewhere where you can quickly refer to it.

```dart
ElevatedButton(
  onPressed: () {
    showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) => const ThemeScreen(),
    );
  },
  child: const Text("Color theme"),
)
```