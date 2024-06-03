import 'dart:math';

import 'package:cached_video_player/cached_video_player.dart';
import 'package:dating_concept_ui/foryou_page.dart';
import 'package:dating_concept_ui/profile_page.dart';
import 'package:dating_concept_ui/scale_fade_transition.dart';
import 'package:dating_concept_ui/users_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uicons/uicons.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dating Dribble UI',
      theme: ThemeData(
        textTheme: GoogleFonts.geoTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserGridScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class UserGridScreen extends StatefulWidget {
  const UserGridScreen({super.key});

  @override
  State<UserGridScreen> createState() => _UserGridScreenState();
}

class _UserGridScreenState extends State<UserGridScreen> {
  int crossAxisCount = 3;

  late ScrollController _scrollCtrl;
  @override
  void initState() {
    super.initState();

    _scrollCtrl = ScrollController(
      initialScrollOffset: 250,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            MasonryGridView.count(
              crossAxisCount: crossAxisCount,
              controller: _scrollCtrl,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 1
                      ? const EdgeInsets.only(top: 100.0)
                      : EdgeInsets.zero,
                  child: SizedBox(
                    width: 100,
                    height: 200,
                    child: UserGridItem(
                      user: usersList[index],
                    ),
                  ),
                );
              },
              itemCount: usersList.length,
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 65),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black38.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
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
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black38.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20),
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
                      ),
                    ],
                  ),
                  IconSquare(
                    icon: UIcons.regularRounded.playing_cards,
                    size: 24,
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:
                              const Duration(milliseconds: 1000),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 1000),
                          pageBuilder: (_, __, ___) {
                            return ForYouPage();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return ScaleFadeTransition(
                              animation: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  // const SizedBox(width: 24),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IconSquare extends StatelessWidget {
  const IconSquare({
    super.key,
    this.onTap,
    required this.icon,
    this.color,
    this.size,
  });

  final Color? color;
  final double? size;
  final VoidCallback? onTap;

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.black38.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          size: size ?? 18,
          color: color ?? Colors.white.withOpacity(0.7),
        ),
      ),
    );
  }
}

class UserGridItem extends StatefulWidget {
  final User user;

  UserGridItem({super.key, required this.user});

  @override
  _UserGridItemState createState() => _UserGridItemState();
}

class _UserGridItemState extends State<UserGridItem>
    with AutomaticKeepAliveClientMixin {
  late CachedVideoPlayerController _controller;

  bool liked = false;

  @override
  void initState() {
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
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) {
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
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: _controller.value.isInitialized
                  ? Hero(
                      tag: widget.user.videoUrl,
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.black,
                          width: double.infinity,
                          height: 400,
                          alignment: Alignment.center,
                          child: Transform.scale(
                            scale: 2,
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: CachedVideoPlayer(_controller),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.black,
                    ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StatefulBuilder(builder: (context, setState2) {
                        return InkWell(
                          onTap: () {
                            setState2(() {
                              widget.user.liked = !widget.user.liked;
                              liked = !liked;
                            });
                          },
                          child: IconSquare(
                            size: 12,
                            icon: widget.user.liked
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: Colors.white,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '${widget.user.age}\n',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                          children: [
                            TextSpan(
                              text: widget.user.name.split(' ').last,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
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
                ),
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
