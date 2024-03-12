# Social Kit


## Features

Beautiful UI Kit for Soical Apps.

## Getting started


- Install the package


## Usage

Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```




## Widgets

### WaveCarouselEntry

- This displays an entry style widget. It does not have a scaffold. Meaning you can add it in a screen if you want.
- It is best fit on mobile size.

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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_kit/social_kit.dart';

class EntryScreen extends StatelessWidget {
  static const String routeName = '/Entry';
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WaveCarouselEntry(
        onStart: () {
          Navigator.pop(context);
        },
        logo: CachedNetworkImage(
          imageUrl: 'https://picsum.photos/250/',
          fit: BoxFit.cover,
        ),
        items: [
          (
            title: "캐주얼 대화",
            subtitle:
                "우리의 미팅 앱을 사용하여 이성과의 캐주얼하고 즐거운 대화에 참여하세요. 손쉽게 연결하고 채팅하세요.",
            image: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=9',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: "소셜 서클 확장",
            subtitle:
                "새로운 사람들을 만나 소셜 서클을 손쉽게 확장하세요. 우리의 앱은 진정한 연결과 친근한 상호작용을 위해 디자인되었습니다.",
            image: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=10',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: "새로운 연결 발견",
            subtitle:
                "흥미로운 개인들과 연결을 찾아보세요. 우리의 미팅 앱은 시야를 넓히고 다양한 사람들을 만나기 쉽게 만들어줍니다.",
            image: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=11',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: "의미 있는 대화 즐기기",
            subtitle:
                "정직한 대화를 통해 의미 있는 연결을 만들어보세요. 우리의 앱은 이성을 만날 수 있는 친근하고 환영받는 환경을 조성합니다.",
            image: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=12',
              fit: BoxFit.cover,
            ),
          ),
        ],
        backgroundWidget: SleepWalker(
          alignments: const [
            (
              alignment: Alignment.centerLeft,
              duration: Duration(milliseconds: 2000),
            ),
            (
              alignment: Alignment.centerRight,
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
              alignment: Alignment.centerLeft,
              duration: Duration(seconds: 1),
            ),
          ],
          repeat: true,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
```