import 'package:flutter/material.dart';
import 'package:social_kit/social_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WaveCarouselEntry(
                      onStart: () {
                        print('tapped');
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
                    ),
                  ),
                );
              },
              child: const Text('Wave Carousel Entry Screen'),
            ),
          ],
        ),
      ),
    );
  }
}