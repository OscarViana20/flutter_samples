import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/models/movie_tickets_model.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/video_clipper.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTimesResp extends StatefulWidget {
  MovieTimesResp({super.key, required this.currentPage});

  final int currentPage;

  @override
  _MovieTimesRespState createState() => _MovieTimesRespState();
}

const Color _colorButtons = Color(0xFF5E01FF);
const Color _colorPanel = Color(0xFF0F01FF);

class _MovieTimesRespState extends State<MovieTimesResp>
    with TickerProviderStateMixin {
  final shadows = [
    BoxShadow(
      color: _colorButtons.withOpacity(0.5),
      blurRadius: 20,
      spreadRadius: 5,
      offset: Offset(0, 5), // Shadow position
    )
  ];

  final textShadows = [
    Shadow(
      color: Colors.red.shade900.withOpacity(1.0),
      offset: Offset(1.0, 1.0),
      blurRadius: 5.0,
    ),
  ];

  int selectedHour = 0;
  int selectedDate = -1;

  late AnimationController _controller;
  late Animation<double> _cinemaScreenTween;
  late AnimationController _cinemaController;
  late YoutubePlayerController _videoPlayerController;

  void _controllerListener() {
    setState(() {});
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 200), upperBound: 0.1);
    _controller.addListener(_controllerListener);

    _cinemaController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _cinemaScreenTween = Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Curves.easeInOutQuart))
        .animate(_cinemaController);

    _videoPlayerController = YoutubePlayerController(
        initialVideoId: 'Zi4LMpSDccc', // id youtube video
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
          loop: true,
          hideControls: true,
        ));

    super.initState();
  }

  @override
  void deactivate() {
    _videoPlayerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _cinemaController.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Choose Date',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0)),
        _showDates(),
        Row(
          children: [
            Text("AMC NewPark 12",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(width: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFF5E01FF)),
              child: Text("10min",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            )
          ],
        ),
        Text("989 lifestyle St Malence, Califonia 19289",
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade300,
                fontWeight: FontWeight.w500)),
        SizedBox(height: 16),
        _movieStudio(),
        _movieCinemaRoom()
      ],
    );
  }

  Widget _showDates() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 16.0),
      child: Container(
          height: 95,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularList[widget.currentPage].showDates.length,
              itemBuilder: (context, index) {
                final item = popularList[widget.currentPage].showDates[index];
                return Transform.scale(
                  scale: selectedDate == index ? 1 - _controller.value : 1,
                  child: GestureDetector(
                    onTapDown: (_) {
                      setState(() {
                        selectedDate = index;
                      });
                      _controller.forward();
                    },
                    onTapUp: (_) {
                      _controller.reverse();
                    },
                    child: Container(
                      width: 110,
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: selectedDate == index ? _colorButtons : null,
                          border: selectedDate == index
                              ? null
                              : Border.all(
                                  width: 1, color: Colors.grey.shade300),
                          boxShadow: selectedDate == index ? shadows : []),
                      child: Column(
                        children: [
                          Text(item.day,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade300,
                                  fontSize: 18.0,
                                  shadows: selectedDate == index
                                      ? textShadows
                                      : [])),
                          Text(item.date,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0)),
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }

  Widget _movieStudio() {
    final times = popularList[widget.currentPage].times;

    List<List<TimeDay>> rows = [];
    List<TimeDay> columnNumbers = [];

    int column = 0;
    for (int i = 0; i < times.length; i++) {
      columnNumbers.add(times[i]);
      if (column == 2) {
        rows.add(columnNumbers);
        columnNumbers = [];
        column = 0;
      } else {
        column++;
      }
    }

    List<Widget> timesWidget = rows
        .map(
          (columns) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: columns.map((timeDay) {
              return Padding(
                padding: EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                    if (!timeDay.isAll && selectedHour != timeDay.index) {
                      setState(() {
                        selectedHour = timeDay.index;
                        _cinemaController.forward();
                        _videoPlayerController.play();
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: timeDay.isAll
                          ? Colors.blueGrey.shade700.withOpacity(0.7)
                          : (selectedHour == timeDay.index
                              ? _colorButtons
                              : null),
                      border: (timeDay.isAll || selectedHour == timeDay.index)
                          ? null
                          : Border.all(width: 0.5, color: Colors.grey.shade300),
                      //boxShadow: shadows,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(timeDay.hour,
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  ),
                ),
              );
            }).toList(),
          ),
        )
        .toList();

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [_colorPanel.withOpacity(0.5), Color(0xFF0B0F14)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.9],
              tileMode: TileMode.clamp),
          color: _colorButtons.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Studio #1",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16.0)),
          Column(children: timesWidget),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _movieCinemaRoom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Screen",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14.0)),
        SizedBox(height: 10),
        AnimatedBuilder(
          animation: _cinemaController,
          builder: (ctx, child) {
            double perspective = 0.004 * _cinemaScreenTween.value;
            return AspectRatio(
              aspectRatio: 16 / 9,
              child: Transform(
                  alignment: Alignment.topCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, perspective)
                    ..rotateX(_cinemaScreenTween.value),
                  child: ClipPath(
                      clipper:
                          VideoClipper(curveValue: _cinemaScreenTween.value),
                      child: child)),
            );
          },
          child: YoutubePlayer(
              controller: _videoPlayerController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent),
        ),
      ],
    );
  }
}
