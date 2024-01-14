import 'dart:async';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:ht_new_movpresenter/utils/net_request/url_getImageurl.dart';
import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:ht_new_movpresenter/utils/tools/ht_sys_tool.dart';

FijkPanelWidgetBuilder fijkPanel2Builder1({
  Key? key,
  final bool fill = false,
  final int duration = 4000,
  final bool doubleTap = true,
  final bool snapShot = false,
  final bool isSave = false,

  ///是否收藏
  final VoidCallback? onBack,

  ///1 分享  2.投屏 3.收藏  4.vip 5.字幕 6.返回按钮
  final void Function(int state, BuildContext context)? callBack,
}) {
  return (FijkPlayer player, FijkData data, BuildContext context, Size viewSize,
      Rect texturePos) {
    return _FijkPanel2(
      key: key,
      player: player,
      data: data,
      onBack: onBack,
      viewSize: viewSize,
      texPos: texturePos,
      fill: fill,
      doubleTap: doubleTap,
      snapShot: snapShot,
      hideDuration: duration,
      callBack: callBack,
      isSave: isSave,
    );
  };
}

class _FijkPanel2 extends StatefulWidget {
  final FijkPlayer player;
  final FijkData data;
  final VoidCallback? onBack;
  final Size viewSize;
  final Rect texPos;
  final bool fill;
  final bool doubleTap;
  final bool snapShot;
  final int hideDuration;
  final bool isSave;
  final void Function(int state, BuildContext context)? callBack;

  const _FijkPanel2({
    Key? key,
    required this.player,
    required this.data,
    this.fill = false,
    this.onBack,
    required this.viewSize,
    this.hideDuration = 4000,
    this.doubleTap = false,
    this.snapShot = false,
    required this.texPos,
    required this.callBack,
    this.isSave = false,
  })  : assert(hideDuration > 0 && hideDuration < 10000),
        super(key: key);

  @override
  __FijkPanel2State createState() => __FijkPanel2State();
}

class __FijkPanel2State extends State<_FijkPanel2> {
  FijkPlayer get player => widget.player;

  Timer? _hideTimer;
  bool _hideStuff = true;

  Timer? _statelessTimer;
  bool _prepared = false;
  bool _playing = false;
  bool _dragLeft = false;
  double? _volume;
  double? _brightness;

  double _seekPos = -1.0;
  Duration _duration = const Duration();
  Duration _currentPos = const Duration();
  Duration _bufferPos = const Duration();

  StreamSubscription? _currentPosSubs;
  StreamSubscription? _bufferPosSubs;

  late StreamController<double> _valController;

  // snapshot
  ImageProvider? _imageProvider;
  Timer? _snapshotTimer;
  bool _isSave = false;

  // Is it needed to clear seek data in FijkData (widget.data)
  bool _needClearSeekData = true;

  static const FijkSliderColors sliderColors = FijkSliderColors(
      cursorColor: Color.fromARGB(240, 250, 100, 10),
      playedColor: Color.fromARGB(200, 240, 90, 50),
      baselineColor: Color.fromARGB(100, 20, 20, 20),
      bufferedColor: Color.fromARGB(180, 200, 200, 200));

  @override
  void initState() {
    super.initState();

    _valController = StreamController.broadcast();
    _prepared = player.state.index >= FijkState.prepared.index;
    _playing = player.state == FijkState.started;
    _duration = player.value.duration;
    _currentPos = player.currentPos;
    _bufferPos = player.bufferPos;
    _isSave = widget.isSave;

    _currentPosSubs = player.onCurrentPosUpdate.listen((v) {
      if (_hideStuff == false) {
        setState(() {
          _currentPos = v;
        });
      } else {
        _currentPos = v;
      }
      if (_needClearSeekData) {
        // widget.data.clearValue(FijkData._fijkViewPanelSeekto);
      }
      _needClearSeekData = false;
    });

    // if (widget.data.contains(FijkData._fijkViewPanelSeekto)) {
    //   var pos = widget.data.getValue(FijkData._fijkViewPanelSeekto) as double;
    //   _currentPos = Duration(milliseconds: pos.toInt());
    // }

    _bufferPosSubs = player.onBufferPosUpdate.listen((v) {
      if (_hideStuff == false) {
        setState(() {
          _bufferPos = v;
        });
      } else {
        _bufferPos = v;
      }
    });

    player.addListener(_playerValueChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _valController.close();
    _hideTimer?.cancel();
    _statelessTimer?.cancel();
    _snapshotTimer?.cancel();
    _currentPosSubs?.cancel();
    _bufferPosSubs?.cancel();
    player.removeListener(_playerValueChanged);
  }

  double dura2double(Duration d) {
    return d.inMilliseconds.toDouble();
  }

  void _playerValueChanged() {
    FijkValue value = player.value;

    if (value.duration != _duration) {
      if (_hideStuff == false) {
        setState(() {
          _duration = value.duration;
        });
      } else {
        _duration = value.duration;
      }
    }
    bool playing = (value.state == FijkState.started);
    bool prepared = value.prepared;
    if (playing != _playing ||
        prepared != _prepared ||
        value.state == FijkState.asyncPreparing) {
      setState(() {
        _playing = playing;
        _prepared = prepared;
      });
    }
  }

  void _restartHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(Duration(milliseconds: widget.hideDuration), () {
      setState(() {
        _hideStuff = true;
      });
    });
  }

  void onTapFun() {
    if (_hideStuff == true) {
      _restartHideTimer();
    }
    setState(() {
      _hideStuff = !_hideStuff;
    });
  }

  void playOrPause() {
    if (player.isPlayable() || player.state == FijkState.asyncPreparing) {
      if (player.state == FijkState.started) {
        player.pause();
      } else {
        player.start();
      }
    } else if (player.state == FijkState.initialized) {
      player.start();
    } else {
      FijkLog.w("Invalid state ${player.state} ,can't perform play or pause");
    }
  }

  void onDoubleTapFun() {
    playOrPause();
  }

  void onVerticalDragStartFun(DragStartDetails d) {
    if (d.localPosition.dx > panelWidth() / 2) {
      // right, volume
      _dragLeft = false;
      FijkVolume.getVol().then((v) {
        // if (!widget.data.contains(FijkData._fijkViewPanelVolume)) {
        //   widget.data.setValue(FijkData._fijkViewPanelVolume, v);
        // }
        setState(() {
          _volume = v;
          _valController.add(v);
        });
      });
    } else {
      // left, brightness
      _dragLeft = true;
      FijkPlugin.screenBrightness().then((v) {
        // if (!widget.data.contains(FijkData._fijkViewPanelBrightness)) {
        //   widget.data.setValue(FijkData._fijkViewPanelBrightness, v);
        // }
        setState(() {
          _brightness = v;
          _valController.add(v);
        });
      });
    }
    _statelessTimer?.cancel();
    _statelessTimer = Timer(const Duration(milliseconds: 2000), () {
      setState(() {});
    });
  }

  void onVerticalDragUpdateFun(DragUpdateDetails d) {
    double delta = d.primaryDelta! / panelHeight();
    delta = -delta.clamp(-1.0, 1.0);
    if (_dragLeft == false) {
      var volume = _volume;
      if (volume != null) {
        volume += delta;
        volume = volume.clamp(0.0, 1.0);
        _volume = volume;
        FijkVolume.setVol(volume);
        setState(() {
          _valController.add(volume!);
        });
      }
    } else if (_dragLeft == true) {
      var brightness = _brightness;
      if (brightness != null) {
        brightness += delta;
        brightness = brightness.clamp(0.0, 1.0);
        _brightness = brightness;
        FijkPlugin.setScreenBrightness(brightness);
        setState(() {
          _valController.add(brightness!);
        });
      }
    }
  }

  void onVerticalDragEndFun(DragEndDetails e) {
    _volume = null;
    _brightness = null;
  }

  Widget buildPlayButton(BuildContext context, double height) {
    Icon icon = (player.state == FijkState.started)
        ? const Icon(Icons.pause)
        : const Icon(Icons.play_arrow);
    bool fullScreen = player.value.fullScreen;
    return IconButton(
      padding: const EdgeInsets.all(0),
      iconSize: fullScreen ? height : height * 0.8,
      color: const Color(0xFFFFFFFF),
      icon: icon,
      onPressed: playOrPause,
    );
  }

  Widget buildFullScreenButton(BuildContext context, double height) {
    Icon icon = player.value.fullScreen
        ? const Icon(Icons.fullscreen_exit)
        : const Icon(Icons.fullscreen);
    bool fullScreen = player.value.fullScreen;
    return IconButton(
      padding: const EdgeInsets.all(0),
      iconSize: fullScreen ? height : height * 0.8,
      color: const Color(0xFFFFFFFF),
      icon: icon,
      onPressed: () {
        player.value.fullScreen
            ? player.exitFullScreen()
            : player.enterFullScreen();
      },
    );
  }

  Widget buildTimeText(BuildContext context, double height) {
    // String text =
    //     "${_duration2String(_currentPos)}" + "/${_duration2String(_duration)}";
    return Text(SysTools.formatDuration(player.currentPos),
        style: const TextStyle(fontSize: 12, color: Color(0xFFFFFFFF)));
  }

  Widget buildAllTimeText() {
    return Text(SysTools.formatDuration(player.value.duration),
        style: const TextStyle(fontSize: 12, color: Color(0xFFFFFFFF)));
  }

  Widget buildSlider(BuildContext context) {
    double duration = dura2double(_duration);

    double currentValue = _seekPos > 0 ? _seekPos : dura2double(_currentPos);
    currentValue = currentValue.clamp(0.0, duration);

    double bufferPos = dura2double(_bufferPos);
    bufferPos = bufferPos.clamp(0.0, duration);

    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: FijkSlider(
        colors: sliderColors,
        value: currentValue,
        cacheValue: bufferPos,
        min: 0.0,
        max: duration,
        onChanged: (v) {
          _restartHideTimer();
          setState(() {
            _seekPos = v;
          });
        },
        onChangeEnd: (v) {
          setState(() {
            player.seekTo(v.toInt());
            _currentPos = Duration(milliseconds: _seekPos.toInt());
            // widget.data.setValue(FijkData._fijkViewPanelSeekto, _seekPos);
            _needClearSeekData = true;
            _seekPos = -1.0;
          });
        },
      ),
    );
  }

  Widget buildBottom(BuildContext context, double height) {
    if (_duration.inMilliseconds > 0) {
      return Row(
        children: <Widget>[
          buildPlayButton(context, height),
          buildTimeText(context, height),
          Expanded(child: buildSlider(context)),
          const SizedBox(width: 10),
          buildAllTimeText(),
          buildFullScreenButton(context, height),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          buildPlayButton(context, height),
          Expanded(child: Container()),
          buildFullScreenButton(context, height),
        ],
      );
    }
  }

  Widget topWidget() {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          const SizedBox(
            width: 17.5,
          ),
          GestureDetector(
            onTap: () {
              if (widget.callBack != null) {
                widget.callBack!(6, context);
              }
              // Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 16.5,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 44,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Row(children: [
                    GestureDetector(
                      ///vip
                      onTap: () {
                        if (widget.callBack != null) {
                          widget.callBack!(4, context);
                        }
                      },
                      child: CachedNetworkImage(
                        imageUrl: ImageURL.url_249,
                        width: 100.0,
                        height: 26.0,
                      ),
                    ),
                    Container(width: 10.0),
                    if (player.value.fullScreen == false) ...[
                      GestureDetector(
                        ///cc
                        onTap: () {
                          if (widget.callBack != null) {
                            widget.callBack!(5, context);
                          }
                        },
                        child: CachedNetworkImage(
                          imageUrl: ImageURL.url_315,
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                    ],
                    Visibility(
                      visible: HTUserStore.toolConfigBean?.airplay == null?false:true,
                      child: GestureDetector(
                        ///tv
                        onTap: () {
                          if (widget.callBack != null) {
                            widget.callBack!(2, context);
                          }
                        },
                        child: CachedNetworkImage(
                          imageUrl: ImageURL.url_329,
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    if (player.value.fullScreen) ...[
                      GestureDetector(
                        ///collection
                        onTap: () {
                          if (widget.callBack != null) {
                            widget.callBack!(3, context);
                            setState(() {
                              _isSave = !_isSave;
                            });
                          }
                        },
                        child: CachedNetworkImage(
                          imageUrl:
                              _isSave ? ImageURL.url_258 : ImageURL.url_259,
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                    ],
                    if (player.value.fullScreen) ...[
                      GestureDetector(
                        ///share
                        onTap: () {
                          if (widget.callBack != null) {
                            widget.callBack!(1, context);
                          }
                        },
                        child: CachedNetworkImage(
                          imageUrl: ImageURL.url_105,
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                      const SafeArea(left: false, child: SizedBox(width: 10.0)),
                    ]
                  ])
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void takeSnapshot() {
    player.takeSnapShot().then((v) {
      var provider = MemoryImage(v);
      precacheImage(provider, context).then((_) {
        setState(() {
          _imageProvider = provider;
        });
      });
      FijkLog.d("get snapshot succeed");
    }).catchError((e) {
      FijkLog.d("get snapshot failed");
    });
  }

  Widget buildPanel(BuildContext context) {
    double height = panelHeight();

    bool fullScreen = player.value.fullScreen;
    Widget centerWidget = Container(
      color: const Color(0x00000000),
    );

    Widget centerChild = Container(
      color: const Color(0x00000000),
    );

    if (fullScreen && widget.snapShot) {
      centerWidget = Row(
        children: <Widget>[
          Expanded(child: centerChild),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  padding: const EdgeInsets.all(0),
                  color: const Color(0xFFFFFFFF),
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    takeSnapshot();
                  },
                ),
              ],
            ),
          )
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        topWidget(),
        // Container(
        //   height: height > 200 ? 80 : height / 5,
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [Color(0x88000000), Color(0x00000000)],
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //     ),
        //   ),
        // ),
        Expanded(
          child: centerWidget,
        ),
        Container(
          height: height > 80 ? 80 : height / 2,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x88000000), Color(0x00000000)],
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter,
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height > 80 ? 45 : height / 2,
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
            child: buildBottom(context, height > 80 ? 40 : height / 2),
          ),
        )
      ],
    );
  }

  GestureDetector buildGestureDetector(BuildContext context) {
    return GestureDetector(
      onTap: onTapFun,
      onDoubleTap: widget.doubleTap ? onDoubleTapFun : null,
      onVerticalDragUpdate: onVerticalDragUpdateFun,
      onVerticalDragStart: onVerticalDragStartFun,
      onVerticalDragEnd: onVerticalDragEndFun,
      onHorizontalDragUpdate: (d) {},
      child: AbsorbPointer(
        absorbing: _hideStuff,
        child: AnimatedOpacity(
          opacity: _hideStuff ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          child: buildPanel(context),
        ),
      ),
    );
  }

  Rect panelRect() {
    Rect rect = player.value.fullScreen || (true == widget.fill)
        ? Rect.fromLTWH(0, 0, widget.viewSize.width, widget.viewSize.height)
        : Rect.fromLTRB(
            max(0.0, widget.texPos.left),
            max(0.0, widget.texPos.top),
            min(widget.viewSize.width, widget.texPos.right),
            min(widget.viewSize.height, widget.texPos.bottom));
    return rect;
  }

  double panelHeight() {
    if (player.value.fullScreen || (true == widget.fill)) {
      return widget.viewSize.height;
    } else {
      return min(widget.viewSize.height, widget.texPos.bottom) -
          max(0.0, widget.texPos.top);
    }
  }

  double panelWidth() {
    if (player.value.fullScreen || (true == widget.fill)) {
      return widget.viewSize.width;
    } else {
      return min(widget.viewSize.width, widget.texPos.right) -
          max(0.0, widget.texPos.left);
    }
  }

  Widget buildBack(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(left: 5),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Color(0xDDFFFFFF),
      ),
      onPressed: widget.onBack,
    );
  }

  Widget buildStateless() {
    var volume = _volume;
    var brightness = _brightness;
    if (volume != null || brightness != null) {
      Widget toast = volume == null
          ? defaultFijkBrightnessToast(brightness!, _valController.stream)
          : defaultFijkVolumeToast(volume, _valController.stream);
      return IgnorePointer(
        child: AnimatedOpacity(
          opacity: 1,
          duration: const Duration(milliseconds: 500),
          child: toast,
        ),
      );
    } else if (player.state == FijkState.asyncPreparing || player.isBuffering) {
      return Container(
        alignment: Alignment.center,
        child: const SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white)),
        ),
      );
    } else if (player.state == FijkState.error) {
      return Container(
        alignment: Alignment.center,
        child: const Icon(
          Icons.error,
          size: 30,
          color: Color(0x99FFFFFF),
        ),
      );
    } else if (_imageProvider != null) {
      _snapshotTimer?.cancel();
      _snapshotTimer = Timer(const Duration(milliseconds: 1500), () {
        if (mounted) {
          setState(() {
            _imageProvider = null;
          });
        }
      });
      return Center(
        child: IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellowAccent, width: 3)),
            child:
                Image(height: 200, fit: BoxFit.contain, image: _imageProvider!),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    Rect rect = panelRect();

    List ws = <Widget>[];

    if (_statelessTimer != null && _statelessTimer!.isActive) {
      ws.add(buildStateless());
    } else if (player.state == FijkState.asyncPreparing) {
      ws.add(buildStateless());
    } else if (player.state == FijkState.error) {
      ws.add(buildStateless());
    } else if (_imageProvider != null) {
      ws.add(buildStateless());
    }
    ws.add(buildGestureDetector(context));
    // if (widget.onBack != null) {
    //   ws.add(buildBack(context));
    // }
    return Positioned.fromRect(
      rect: rect,
      child: Stack(children: ws as List<Widget>),
    );
  }
}

// class CustomPlayerView extends StatefulWidget {
//   const CustomPlayerView({Key? key}) : super(key: key);

//   @override
//   State<CustomPlayerView> createState() => _CustomPlayerViewState();
// }

// class _CustomPlayerViewState extends State<CustomPlayerView> {
//   late HTVideoDescProvider provider;

//   @override
//   void initState() {
//     super.initState();
//     provider = context.read<HTVideoDescProvider>();
//     provider.playerAddListener();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           topWidget(),
//           Selector<HTVideoDescProvider, Tuple2<bool,Duration>>(
//             selector: (p0, p1) => Tuple2(p1.refreshPlayer, p1.player.currentPos),
//             builder: (context, value, child) {
//               return bottomWidget();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   ///1.顶部
//   Widget topWidget() {
//     return Container(
//       height: 44,
//       width: double.infinity,
//       color: Colors.red,
//       child: Row(
//         children: [],
//       ),
//     );
//   }

//   ///2.底部
//   Widget bottomWidget() {
//     return Container(
//       height: 44,
//       width: double.infinity,
//       // color: Colors.amber,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               const Color(0xFF000000).withAlpha(0),
//               const Color(0xFF000000).withAlpha(50),
//               const Color(0xFF000000).withAlpha(180),
//             ]),
//       ),
//       child: Row(
//         children: [
//           const SizedBox(width: 10),

//           /// 163 162  播放/暂停按钮
//           GestureDetector(
//             onTap:provider.playAction,
//             child: CachedNetworkImage(
//               imageUrl: provider.player.state == FijkState.started
//                   ? ImageURL.url_162
//                   : ImageURL.url_163,
//               width: 22,
//               height: 22,
//             ),
//           ),
//           const SizedBox(width: 10),

//           ///播放时间
//           Text(
//             provider.startTimeString(),
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(width: 10),

//           ///进度条
//           Expanded(
//             child: Container(
//               color: Colors.red,
//               height: 2,
//             ),
//           ),
//           const SizedBox(width: 10),

//           ///总时间
//           Text(
//             provider.allTimeString(),
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(width: 10),
//           GestureDetector(
//             onTap: provider.fullScreenAction,
//             child: CachedNetworkImage(
//               imageUrl: ImageURL.url_318,
//               width: 22,
//               height: 22,
//             ),
//           ),
//           const SizedBox(width: 10),
//         ],
//       ),
//     );
//   }
// }
