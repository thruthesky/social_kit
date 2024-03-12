import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_kit/social_kit.dart';

typedef WaveCarouselItem = ({
  String title,
  String subtitle,
  Widget image,
});

class WaveCarouselEntry extends StatefulWidget {
  static const String routeName = '/WaveCarouselEntry';
  const WaveCarouselEntry({
    super.key,
    required this.logo,
    required this.items,
    required this.onStart,
    this.autoSwipeInterval = 3000,
  });
  final Widget logo;
  final List<WaveCarouselItem> items;
  final VoidCallback onStart;
  final int autoSwipeInterval;

  @override
  State<WaveCarouselEntry> createState() => _WaveCarouselEntryState();
}

class _WaveCarouselEntryState extends State<WaveCarouselEntry> {
  DragUpdateDetails? updateDetails;
  LoopPageController controller = LoopPageController();
  final indicator = PublishSubject<int>();
  Timer? autoSwipe;

  @override
  void initState() {
    super.initState();
    autoSwipe =
        Timer.periodic(Duration(seconds: widget.autoSwipeInterval), (timer) {
      if (mounted) {
        controller
            .nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        )
            .then((value) {
          // then 에서 해야 올바른 페이지 번호가 나옴
          indicator.add(controller.page.toInt());
        });
      }
    });
  }

  @override
  void dispose() {
    autoSwipe?.cancel();
    indicator.close();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text('No items'),
        ),
      );
    }
    // 스와이프 제스쳐를 받아서, ListView 나 Indicator 등을 업데이트
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragUpdate: (details) {
        int sensitivity = 8;
        if (details.delta.dx.abs() > sensitivity) {
          updateDetails = details;
        }
      },
      onHorizontalDragEnd: (details) {
        if (updateDetails != null) {
          autoSwipe?.cancel();
          if (updateDetails!.delta.dx > 0) {
            // 오른쪽으로 스와이프'
            controller
                .previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            )
                .then((value) {
              // then 에서 해야 올바른 페이지 번호가 나옴
              indicator.add(controller.page.toInt());
            });
          } else if (updateDetails!.delta.dx < 0) {
            //  왼쪽으로 스와이프'
            controller
                .nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            )
                .then((value) {
              // then 에서 해야 올바른 페이지 번호가 나옴
              indicator.add(controller.page.toInt());
            });
          }
        }
      },
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              ClipPath(
                clipper: WaveUpDownClipper(),
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .6,
                      child: IgnorePointer(
                        child: LoopPageView.builder(
                          controller: controller,
                          itemCount: widget.items.length,
                          itemBuilder: (_, i) => widget.items[i].image,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height * .3,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(.8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 필맘 로고
              Positioned(
                top: MediaQuery.of(context).size.height * .5,
                left: MediaQuery.of(context).size.height * .05,
                child: ClipOval(
                  child: SizedBox(
                    width: 72,
                    height: 72,
                    child: widget.logo,
                  ),
                ),
              ),

              // Indicator
              Positioned(
                top: MediaQuery.of(context).size.height * .54,
                right: MediaQuery.of(context).size.height * .05,
                child: StreamBuilder<int>(
                  stream: indicator,
                  builder: (context, snapshot) {
                    // print('인디케이터: ${snapshot.data}');
                    return AnimatedSmoothIndicator(
                      activeIndex: snapshot.data ?? 0,
                      count: 4,
                      effect: const ExpandingDotsEffect(
                        dotWidth: 8.0,
                        dotHeight: 8.0,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.white,
                      ),
                    );
                  },
                ),
              ),

              /// 제목
              Positioned(
                top: MediaQuery.of(context).size.height * .70,
                left: 0,
                right: 0,
                child: Center(
                  child: StreamBuilder<Object>(
                      stream: indicator,
                      builder: (context, snapshot) {
                        return Text(
                          widget
                              .items[
                                  int.parse(snapshot.data?.toString() ?? '0')]
                              .title,
                          // style: GoogleFonts.nanumPenScript(
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                          // ),
                        );
                      }),
                ),
              ),

              /// 부 제목
              Positioned(
                top: MediaQuery.of(context).size.height * .74,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .7,
                    child: StreamBuilder<Object>(
                      stream: indicator,
                      builder: (context, snapshot) {
                        return Text(
                          widget
                              .items[
                                  int.parse(snapshot.data?.toString() ?? '0')]
                              .subtitle,
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: widget.onStart,
                          child: const Text('getStart'),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}