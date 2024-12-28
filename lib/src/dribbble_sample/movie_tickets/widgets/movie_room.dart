import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/models/movie_tickets_model.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/studio_chair.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/video_clipper.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieRoom extends StatefulWidget {
  
  MovieRoom({
    super.key,
    required this.currentPage
  });

  final int currentPage;

  @override
  _MovieRoomState createState() => _MovieRoomState();
}

class _MovieRoomState extends State<MovieRoom> {

  late YoutubePlayerController _controller;

  var _chairStatus = [
    [0, 2, 1, 1, 0, 1, 1, 2, 0],
    [1, 2, 1, 1, 0, 1, 2, 2, 1],
    [1, 2, 1, 1, 0, 1, 1, 2, 1],
    [1, 2, 2, 1, 0, 1, 1, 2, 1],
    [3, 3, 1, 1, 0, 1, 1, 3, 3],
    [1, 2, 2, 2, 0, 2, 2, 2, 1],
    [1, 2, 2, 2, 2, 2, 2, 2, 1]
  ];

  @override
  void initState() {

    _controller = YoutubePlayerController(
      initialVideoId: popularList[widget.currentPage].trailers[0].initialVideoId, // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        hideControls: true,
        loop: true
      )
    );

    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }
  
  @override
  void dispose() {
    super.dispose();    
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Stack(
      children: [
        Container(
          height: 400,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [              
              Text("Screen", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14.0)),
              SizedBox(height: 10)
            ],
          ),
        ),
        Positioned(
          top: 15,
          left: 0,
          right: 0,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Transform(
              alignment: Alignment.topCenter,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.004)
                ..rotateX(1),
              child: ClipPath(
                clipper: VideoClipper (curveValue: 1),
                child: YoutubePlayer(controller: _controller),//child
              )
            )
          ),
        ),
        Positioned(
          top: 85,
          left: 0,
          right: 0,
          child: Center(child: Text('SCREENOS', style: TextStyle(color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold)))
        ),
        Positioned(
          top: 115,
          left: 0,
          right: 0,
          child: Container(
            width: size.width, 
            child: _chairList(),
          )
        ),
      ],
    );
  }

  Widget _chairList() {
    // 1 is free, 2 is reserved, 3 is notavailable, 4 is yours
    return Container(
      child: Column(
        children: [
          for (int i = 0; i < 7; i++) 
            Row(
              children: [
                for (int x = 0; x < 9; x++)
                  Expanded(
                    child: _chairStatus[i][x] == 0 ?  
                      SizedBox.shrink() : 
                      GestureDetector(
                        onTap: () {
                          if (_chairStatus[i][x] == 1) {
                            setState(() { _chairStatus[i][x] = 4; });
                          } else if (_chairStatus[i][x] == 4) {
                            setState(() { _chairStatus[i][x] = 1; });
                          }
                        },
                        child: Container(
                          height: 28,
                          margin: EdgeInsets.all(5),
                          child: _chairStatus[i][x] == 1 ? StudioChair.whiteChair()
                              : _chairStatus[i][x] == 2 ? StudioChair.greyChair()
                              : _chairStatus[i][x] == 3 ? StudioChair.redChair()
                              : StudioChair.purpleChair(),
                        ),
                      ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}