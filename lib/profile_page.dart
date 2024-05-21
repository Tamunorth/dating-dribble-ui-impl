import 'dart:math';

import 'package:cached_video_player/cached_video_player.dart';
import 'package:dating_concept_ui/users_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:uicons/uicons.dart';
import 'package:video_player/video_player.dart';

import 'main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.user, required this.controller});

  final User user;

  final CachedVideoPlayerController controller;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  // late CachedVideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
  }

  final profileDelayDuration = Duration(milliseconds: 200);
  final profileAnimationDuration = Duration(milliseconds: 700);
  final profileCurve = Curves.easeInOut;

  bool liked = false;
  bool showControls = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Hero(
            tag: widget.user.videoUrl,
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.black,
                width: double.infinity,
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: 2,
                  child: AspectRatio(
                    aspectRatio: widget.controller.value.aspectRatio,
                    child: CachedVideoPlayer(widget.controller),
                  ),
                ),
              ),
            ),
          ),
          if (showControls)
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 54),
                  child: Row(
                    children: [
                      IconSquare(
                        icon: Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 24,
                        onTap: () {
                          setState(() {
                            showControls = false;
                          });
                          Navigator.of(context).pop();
                        },
                      )
                          .animate(delay: profileDelayDuration)
                          .fade(duration: profileAnimationDuration)
                          .scale(duration: profileAnimationDuration),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              width: 70,
                              height: 70,
                              child: Image.network(
                                widget.user.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                              .animate(
                                delay: (profileDelayDuration +
                                    (profileAnimationDuration * 2)),
                              )
                              .fade(duration: profileAnimationDuration)
                              .scale(duration: profileAnimationDuration),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '${widget.user.name.split(' ').first} \n',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
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
                                TextSpan(
                                  text: '  ${widget.user.age}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ],
                            ),
                          )
                              .animate(
                                delay: (profileDelayDuration +
                                    (profileAnimationDuration * 3)),
                              )
                              .fade(
                                duration: profileAnimationDuration,
                                curve: profileCurve,
                              )
                              .scale(
                                alignment: Alignment.bottomLeft,
                                curve: profileCurve,
                                duration: profileAnimationDuration,
                              ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                UIcons.solidRounded.marker,
                                color: Colors.white,
                                size: 12,
                              )
                                  .animate(
                                    delay: (profileDelayDuration +
                                        (profileAnimationDuration * 3)),
                                  )
                                  .fadeIn(
                                    curve: profileCurve,
                                    duration: profileAnimationDuration,
                                  )
                                  .slideX(
                                    begin: -1,
                                    curve: profileCurve,
                                    duration: profileAnimationDuration,
                                  ),
                              const SizedBox(width: 5),
                              Text(
                                widget.user.location,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                              )
                                  .animate(
                                    delay: (profileDelayDuration +
                                        (profileAnimationDuration * 3)),
                                  )
                                  .fadeIn(
                                    curve: profileCurve,
                                    duration: profileAnimationDuration,
                                  )
                                  .slideX(
                                    begin: 1,
                                    curve: profileCurve,
                                    duration: profileAnimationDuration,
                                  ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
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
                              )
                                  .animate(
                                    delay: (profileDelayDuration * 1.2),
                                  )
                                  .fade(duration: profileAnimationDuration)
                                  .scale(duration: profileAnimationDuration),
                            );
                          }),
                          const SizedBox(
                            height: 24,
                          ),
                          const IconSquare(
                            size: 20,
                            icon: Icons.chat_outlined,
                            color: Colors.white,
                          )
                              .animate(
                                delay: (profileDelayDuration +
                                    profileAnimationDuration),
                              )
                              .fade(duration: profileAnimationDuration)
                              .scale(duration: profileAnimationDuration),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
