# Carousel Entry




## Basic Carousel Entry

Below is a complete example of `BasicCarouselEntry`.

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silvers/defines/terms.dart';
import 'package:silvers/global.dart';
import 'package:silvers/screens/entry/phone_number_login.screen.dart';
import 'package:social_kit/social_kit.dart';

class EntryScreen extends StatelessWidget {
  static const String routeName = '/Entry';
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subtitleStyle = Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w400,
          height: 1.5,
        );
    return Scaffold(
      body: BasicCarouselEntry(
        autoSwipeInterval: 3000,
        titleSpacing: 16,
        bottomStroke: 2,
        bottomStrokeColor: Colors.grey.shade300,
        bottomGradient: const SizedBox.shrink(),
        indicatorActiveColor: Colors.indigo,
        indicatorColor: Colors.grey,
        start: ElevatedButton(
          onPressed: () async {
            final re = await showGeneralDialog<bool?>(
                context: context,
                pageBuilder: (context, _, __) {
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(xl),
                      child: Scaffold(
                        body: Padding(
                          padding: const EdgeInsets.all(lg),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '실버스 가입약관',
                                style: context.titleLarge,
                              ),
                              const Divider(
                                height: 32,
                              ),
                              const Expanded(
                                child: SingleChildScrollView(
                                  child: Text(termsAndConditions),
                                ),
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () => context.pop(false),
                                    child: const Text('닫기'),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () => context.pop(true),
                                    child: const Text('동의합니다.'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
            if (re == true && context.mounted) {
              showGeneralDialog(
                context: context,
                pageBuilder: ($, $$, $$$) => const PhoneNumberLoginScreen(),
              );
            }
          },
          child: const Text('     시작하기     '),
        ),
        items: [
          (
            title: Text(
              "인생은 60부터가 재미있죠",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              "즐겁고 행복한\n중장년층 온&오프라인 커뮤니티",
              style: subtitleStyle,
              textAlign: TextAlign.center,
            ),
            image: Image.asset(
              'assets/images/entry/0.webp',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.dstOver,
            ),
          ),
          (
            title: Text(
              "시니어 커뮤티니",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              "시니어 소셜 커뮤니티? 말이 좀 어렵죠\n그냥 인연을 만나는 곳이에요.",
              style: subtitleStyle,
              textAlign: TextAlign.center,
            ),
            image: Image.asset(
              'assets/images/entry/1.webp',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: Text(
              "은퇴 후 자기 개발",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              "이제 시작입니다. 커뮤니티를 통해 새로운 취미, 공부, 인연을 만나보세요.",
              style: subtitleStyle,
              textAlign: TextAlign.center,
            ),
            image: Image.asset(
              'assets/images/entry/2.webp',
              fit: BoxFit.cover,
            ),
          ),
          (
            title: Text(
              "채팅이 아닌 실제 만남",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              "인생 짧죠. 우리는 진짜 만납니다.\n커뮤니티에서 친구가 되고 직접 만나 즐겁고 행복한 인연을 만드세요.",
              style: subtitleStyle,
              textAlign: TextAlign.center,
            ),
            image: Image.asset(
              'assets/images/entry/3.webp',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
```