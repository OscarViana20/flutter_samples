import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailerPage extends StatefulWidget {
  
  MovieTrailerPage({
    super.key,
    this.initialVideoId
  });

  final String? initialVideoId;

  @override
  _MovieTrailerPageState createState() => _MovieTrailerPageState();
}

class _MovieTrailerPageState extends State<MovieTrailerPage> {
  
  late YoutubePlayerController _controller;

  @override
  void initState() {
    
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
    ]);
    
    _controller = YoutubePlayerController(
      initialVideoId: widget.initialVideoId!, // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      )
    );
    super.initState();
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _closePage(BuildContext context) {
    setState(() {
      SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
      ]);
    });
    Navigator.of(context).pop();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            onEnded: (_) => _closePage(context)
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.close_sharp, size: 45.0),
            onPressed: () => _closePage(context),
          )
        ],
      ),
    );
  }
}