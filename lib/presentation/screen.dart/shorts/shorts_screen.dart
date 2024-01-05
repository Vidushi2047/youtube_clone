import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_clone/model/user_model.dart';
import 'package:youtube_clone/util/app_sizes.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShortScreen extends StatefulWidget {
  final int index;

  const ShortScreen({super.key, required this.index});
  @override
  _ShortScreenState createState() => _ShortScreenState();
}

class _ShortScreenState extends State<ShortScreen> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: ids[widget.index],
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              videos[widget.index].title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller.load(ids[(ids.indexOf(data.videoId) + 1) % ids.length]);
          _showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) => Scaffold(
        body: ListView(
          children: [
            player,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    videos[widget.index].title.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontFamily: 'Roboto-Bold',
                        height: 0,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  gapH4,
                  Row(
                    children: [
                      Text(
                        '${videos[widget.index].author.subscribers} views',
                        style: const TextStyle(
                            fontFamily: 'Roboto-Light',
                            fontSize: 10,
                            color: Colors.black),
                      ),
                      gapW4,
                      const CircleAvatar(
                        radius: 1,
                        backgroundColor: Colors.grey,
                      ),
                      gapW4,
                      const Text(
                        '7 hours ago',
                        style: TextStyle(
                            fontFamily: 'Roboto-Light',
                            fontSize: 10,
                            color: Colors.black),
                      ),
                      gapW4,
                      const Text(
                        '...more',
                        style: TextStyle(
                            fontFamily: 'Roboto-medium',
                            fontSize: 10,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              videos[widget.index].author.profileImageUrl),
                        ),
                      ),
                      gapW10,
                      Text(
                        videos[widget.index].author.username.toString(),
                        style: const TextStyle(
                            fontFamily: 'Roboto-Medium',
                            fontSize: 15,
                            color: Colors.black),
                      ),
                      gapW10,
                      const Text(
                        '345K',
                        style: TextStyle(
                            fontFamily: 'Roboto-Light',
                            fontSize: 15,
                            color: Colors.black),
                      ),
                      Spacer(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          'Subscribe',
                          style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  _space,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     IconButton(
                  //       icon: const Icon(Icons.skip_previous),
                  //       onPressed: _isPlayerReady
                  //           ? () => _controller.load(ids[
                  //               (ids.indexOf(_controller.metadata.videoId) -
                  //                       1) %
                  //                   ids.length])
                  //           : null,
                  //     ),
                  //     IconButton(
                  //       icon: Icon(
                  //         _controller.value.isPlaying
                  //             ? Icons.pause
                  //             : Icons.play_arrow,
                  //       ),
                  //       onPressed: _isPlayerReady
                  //           ? () {
                  //               _controller.value.isPlaying
                  //                   ? _controller.pause()
                  //                   : _controller.play();
                  //               setState(() {});
                  //             }
                  //           : null,
                  //     ),
                  //     IconButton(
                  //       icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                  //       onPressed: _isPlayerReady
                  //           ? () {
                  //               _muted
                  //                   ? _controller.unMute()
                  //                   : _controller.mute();
                  //               setState(() {
                  //                 _muted = !_muted;
                  //               });
                  //             }
                  //           : null,
                  //     ),
                  //     FullScreenButton(
                  //       controller: _controller,
                  //       color: Colors.blueAccent,
                  //     ),
                  //     IconButton(
                  //       icon: const Icon(Icons.skip_next),
                  //       onPressed: _isPlayerReady
                  //           ? () => _controller.load(ids[
                  //               (ids.indexOf(_controller.metadata.videoId) +
                  //                       1) %
                  //                   ids.length])
                  //           : null,
                  //     ),
                  //   ],
                  // ),
                  // _space,
                  // Row(
                  //   children: <Widget>[
                  //     const Text(
                  //       "Volume",
                  //       style: TextStyle(fontWeight: FontWeight.w300),
                  //     ),
                  //     Expanded(
                  //       child: Slider(
                  //         inactiveColor: Colors.transparent,
                  //         value: _volume,
                  //         min: 0.0,
                  //         max: 100.0,
                  //         divisions: 10,
                  //         label: '${(_volume).round()}',
                  //         onChanged: _isPlayerReady
                  //             ? (value) {
                  //                 setState(() {
                  //                   _volume = value;
                  //                 });
                  //                 _controller.setVolume(_volume.round());
                  //               }
                  //             : null,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // _space,
                  // AnimatedContainer(
                  //   duration: const Duration(milliseconds: 800),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20.0),
                  //     color: _getStateColor(_playerState),
                  //   ),
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //     _playerState.toString(),
                  //     style: const TextStyle(
                  //       fontWeight: FontWeight.w300,
                  //       color: Colors.white,
                  //     ),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700]!;
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900]!;
      default:
        return Colors.blue;
    }
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
                if (_idController.text.isNotEmpty) {
                  var id = YoutubePlayer.convertUrlToId(
                        _idController.text,
                      ) ??
                      '';
                  if (action == 'LOAD') _controller.load(id);
                  if (action == 'CUE') _controller.cue(id);
                  FocusScope.of(context).requestFocus(FocusNode());
                } else {
                  _showSnackBar('Source can\'t be empty!');
                }
              }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
