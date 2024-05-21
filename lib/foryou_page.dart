import 'dart:io';
import 'dart:math';

import 'package:cached_video_player/cached_video_player.dart';
import 'package:dating_concept_ui/extents_page_view.dart';
import 'package:dating_concept_ui/main.dart';
import 'package:dating_concept_ui/profile_page.dart';
import 'package:dating_concept_ui/users_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:uicons/uicons.dart';
import 'package:video_player/video_player.dart';

final _borderRad = BorderRadius.circular(30);

class ForYouPage extends StatefulWidget {
  const ForYouPage({Key? key}) : super(key: key);

  @override
  _ForYouPageState createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {
  late PageController _pageController;
  final int _currentPage = 1;
  double value = 0.0;

  @override
  void initState() {
    super.initState();

    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.85);
  }

  final profileDelayDuration = const Duration(milliseconds: 200);
  final profileAnimationDuration = const Duration(milliseconds: 700);
  final profileCurve = Curves.easeInOut;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration.zero, () {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          // color:
          gradient: LinearGradient(
            colors: [
              const Color(0xff2e1a10).withOpacity(0.9),
              Colors.black38,
              Colors.black,
              const Color(0xff2e1a10),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconSquare(
                        icon: Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 24,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      )
                          .animate(delay: profileDelayDuration)
                          .fade(duration: profileAnimationDuration)
                          .scale(duration: profileAnimationDuration),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black38.withOpacity(0.5),
                          borderRadius: _borderRad,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: const Text(
                          'For you',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      )
                          .animate(
                              delay: (profileDelayDuration +
                                  (profileAnimationDuration * 1.5)))
                          .fade(
                            duration: profileAnimationDuration,
                            curve: profileCurve,
                          )
                          .scale(
                            duration: profileAnimationDuration,
                            curve: profileCurve,
                          ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black38.withOpacity(0.4),
                          borderRadius: _borderRad,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Text(
                          'Nearby',
                          style: TextStyle(
                            fontSize: 12,
                            // fontWeight: FontWeight.w700,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      )
                          .animate(
                              delay: (profileDelayDuration +
                                  profileAnimationDuration))
                          .fade(
                            duration: profileAnimationDuration,
                            curve: profileCurve,
                          )
                          .scale(
                            duration: profileAnimationDuration,
                            curve: profileCurve,
                          ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.black38.withOpacity(0.3),
                      borderRadius: _borderRad,
                    ),
                    child: Icon(
                      UIcons.regularRounded.clock_three,
                      size: 18,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  )
                      .animate(delay: profileDelayDuration)
                      .fade(duration: profileAnimationDuration)
                      .scale(duration: profileAnimationDuration),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 0.85,
                child: ExtentsPageView.extents(
                  extents: 5,
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: usersList.length,
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        if (_pageController.position.haveDimensions) {
                          value =
                              index.toDouble() - (_pageController.page ?? 0);
                          value = (value * 0.02).clamp(-1, 1);
                        }

                        if (index == 0) {
                          return Transform.rotate(
                            angle: pi * value,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: PageViewItem(
                                user: usersList[index],
                              ),
                            ),
                          )
                              .animate(
                                  delay: profileDelayDuration +
                                      (profileAnimationDuration * 2))
                              .fade(
                                duration: profileAnimationDuration,
                                curve: profileCurve,
                              )
                              .slideX(
                                begin: -1,
                                duration: profileAnimationDuration,
                                curve: profileCurve,
                              );
                        }
                        if (index == 1) {
                          return Transform.rotate(
                            angle: pi * value,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: PageViewItem(
                                user: usersList[index],
                              ),
                            ),
                          )
                              .animate(
                                  delay: profileDelayDuration +
                                      (profileAnimationDuration * 2))
                              .fade(
                                duration: profileAnimationDuration,
                                curve: profileCurve,
                              )
                              .scale(
                                duration: profileAnimationDuration * 1.5,
                                curve: profileCurve,
                              );
                        }
                        if (index == 2) {
                          return Transform.rotate(
                            angle: pi * value,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: PageViewItem(
                                user: usersList[index],
                              ),
                            ),
                          )
                              .animate(
                                  delay: profileDelayDuration +
                                      (profileAnimationDuration * 2))
                              .fade(
                                duration: profileAnimationDuration,
                                curve: profileCurve,
                              )
                              .slideX(
                                begin: 1,
                                duration: profileAnimationDuration,
                                curve: profileCurve,
                              );
                        }

                        return Transform.rotate(
                          angle: pi * value,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: PageViewItem(
                              user: usersList[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 80),
            const Text(
              'Every great person should be met\nwith another',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class PageViewItem extends StatefulWidget {
  final User user;

  const PageViewItem({super.key, required this.user});

  @override
  _PageViewItemState createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem>
    with AutomaticKeepAliveClientMixin {
  late CachedVideoPlayerController _controller;

  String? thumbnail;

  bool liked = false;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // Sys.setEnabledSystemUIOverlayStyle
    super.initState();
    _controller = CachedVideoPlayerController.network(widget.user.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            reverseTransitionDuration: Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) {
              return ProfilePage(
                user: widget.user,
                controller: _controller,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: _borderRad,
          color: Colors.black,
        ),
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _controller.value.isInitialized
                  ? Hero(
                      tag: widget.user.videoUrl,
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: _borderRad,
                        child: Container(
                          color: Colors.black,
                          width: double.infinity,
                          height: 500,
                          alignment: Alignment.center,
                          child: Transform.scale(
                            scale: 1.5,
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: CachedVideoPlayer(_controller),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Builder(builder: (context) {
                      if (thumbnail != null) {
                        return Image.file(File(thumbnail!));
                      }
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: _borderRad,
                        ),
                      );
                    }),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '${widget.user.age}\n',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                              children: [
                                TextSpan(
                                  text: widget.user.name.split(' ').last,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          StatefulBuilder(builder: (context, setState2) {
                            return InkWell(
                              onTap: () {
                                setState2(() {
                                  liked = !liked;
                                });
                              },
                              child: IconSquare(
                                size: 20,
                                icon: liked
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                color: Colors.white,
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 24,
                          ),
                          const IconSquare(
                            size: 20,
                            icon: Icons.chat_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 24,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
