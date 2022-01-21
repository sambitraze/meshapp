import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:meshapp/UIController/app_theme.dart';
import 'package:provider/provider.dart';
import './multi_manager/flick_multi_manager.dart';

class FeedPlayerPortraitControls extends StatelessWidget {
  const FeedPlayerPortraitControls(
      {Key? key, this.flickMultiManager, this.flickManager})
      : super(key: key);

  final FlickMultiManager? flickMultiManager;
  final FlickManager? flickManager;

  @override
  Widget build(BuildContext context) {
    FlickDisplayManager displayManager =
        Provider.of<FlickDisplayManager>(context);
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Stack(
        //  crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FlickAutoHideChild(
            showIfVideoNotInitialized: false,
            autoHide: false,
            child: Positioned(
              top: 30,
              right: 30,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FlickLeftDuration(),
              ),
            ),
          ),
          FlickToggleSoundAction(
            toggleMute: () {
              flickMultiManager?.toggleMute();
              displayManager.handleShowPlayerControls();
            },
            child: FlickSeekVideoAction(
              child: Center(
                  child: FlickVideoBuffer(
                bufferingChild: CircularProgressIndicator(
                  color: AppTheme.primaryColor,
                  backgroundColor: Colors.white,
                ),
              )),
            ),
          ),
          Positioned(
            bottom: 0,
            child: FlickAutoHideChild(
              autoHide: false,
              showIfVideoNotInitialized: false,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/Base.png"))),
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width - 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlickPlayToggle(
                      size: 20,
                    ),
                    Expanded(
                      child: Container(
                        child: FlickVideoProgressBar(
                          flickProgressBarSettings: FlickProgressBarSettings(
                            height: 10,
                            handleRadius: 10,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 8,
                            ),
                            backgroundColor: Colors.white24,
                            bufferedColor: Colors.white38,
                            getPlayedPaint: (
                                {double? handleRadius,
                                double? height,
                                double? playedPart,
                                double? width}) {
                              return Paint()
                                ..shader = LinearGradient(colors: [
                                  AppTheme.primaryColor,
                                  Color.fromRGBO(97, 104, 236, 1)
                                ], stops: [
                                  0.0,
                                  0.5
                                ]).createShader(
                                  Rect.fromPoints(
                                    Offset(0, 0),
                                    Offset(width!, 0),
                                  ),
                                );
                            },
                            getHandlePaint: (
                                {double? handleRadius,
                                double? height,
                                double? playedPart,
                                double? width}) {
                              return Paint()
                                ..shader = RadialGradient(
                                  colors: [
                                    Color.fromRGBO(97, 104, 236, 1),
                                    Color.fromRGBO(97, 104, 236, 1),
                                    Colors.white,
                                  ],
                                  stops: [0.0, 0.4, 0.5],
                                  radius: 0.4,
                                ).createShader(
                                  Rect.fromCircle(
                                    center: Offset(playedPart!, height! / 2),
                                    radius: handleRadius!,
                                  ),
                                );
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FlickSoundToggle(
                        toggleMute: () => flickMultiManager?.toggleMute(),
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: FlickFullScreenToggle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
