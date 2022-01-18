import 'dart:io';

import 'package:meshapp/UIController/app_theme.dart';

import '../portrait_controls.dart';
import './flick_multi_manager.dart';
import 'package:flick_video_player/flick_video_player.dart';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:video_player/video_player.dart';

class FlickMultiPlayer extends StatefulWidget {
  const FlickMultiPlayer(
      {Key? key,
      required this.url,
      this.image,
      this.typeVideoType,
      required this.flickMultiManager})
      : super(key: key);

  final String url;
  final String? image;
  final String? typeVideoType;
  final FlickMultiManager flickMultiManager;

  @override
  _FlickMultiPlayerState createState() => _FlickMultiPlayerState();
}

class _FlickMultiPlayerState extends State<FlickMultiPlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    if (widget.typeVideoType == "network") {
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(widget.url)
          ..setLooping(true),
        autoPlay: false,
      );
      widget.flickMultiManager.init(flickManager);
    } else {
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.file(File(widget.url))
          ..setLooping(false),
        autoPlay: false,
      );
      widget.flickMultiManager.init(flickManager);
    }

    super.initState();
  }

  @override
  void dispose() {
    widget.flickMultiManager.remove(flickManager);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visiblityInfo) {
        if (visiblityInfo.visibleFraction > 0.9) {
          widget.flickMultiManager.play(flickManager);
        }
      },
      child: Container(
        child: FlickVideoPlayer(
          flickManager: flickManager,
          flickVideoWithControls: FlickVideoWithControls(
            videoFit: BoxFit.cover,
            playerLoadingFallback: Positioned.fill(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      widget.image!,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: AppTheme.primaryColor,
                        color: Colors.white,
                        strokeWidth: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            controls: FeedPlayerPortraitControls(
              flickMultiManager: widget.flickMultiManager,
              flickManager: flickManager,
            ),
          ),
        ),
      ),
    );
  }
}
