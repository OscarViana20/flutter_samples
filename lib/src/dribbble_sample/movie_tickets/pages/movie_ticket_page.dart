import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/flip_card.dart';
import 'package:video_player/video_player.dart';

class MovieTicketPage extends StatefulWidget {
  const MovieTicketPage({super.key, this.voidCallback});

  final VoidCallback? voidCallback;

  @override
  State<MovieTicketPage> createState() => _MovieTicketPageState();
}

const color = Color(0xFF5E01FF);

class _MovieTicketPageState extends State<MovieTicketPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 1.0, curve: Curves.easeInOut)));

    Future.delayed(new Duration(seconds: 1), () {
      widget.voidCallback!.call();
    });

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Scaffold(
              body: Stack(children: [
            Container(
              width: size.width,
              height: size.height,
              color: color,
            ),
            Positioned(top: -50, child: BackgroundVideo()),
            Positioned(
              top: 0,
              child: Container(
                height: 350,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        color.withOpacity(0.6),
                        color.withOpacity(1)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.7, 1],
                      tileMode: TileMode.clamp),
                ),
              ),
            ),
            Positioned(
              top: kToolbarHeight / 2,
              child: Opacity(
                opacity: _animation.value,
                child: Row(
                  children: [
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.close_sharp, size: 40.0),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(width: 15.0),
                    Text('Ticket',
                        style: TextStyle(color: Colors.white, fontSize: 28))
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
                left: 0,
                right: 0,
                bottom:
                    (kToolbarHeight * 2) - size.height * (1 - _animation.value),
                duration: new Duration(milliseconds: 300),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: size.width,
                          height: size.height / 1.5,
                          padding: EdgeInsets.all(25),
                          color: Color(0xFF0F01FF),
                          child: Text(
                            "Frozen II - Original Motion Picture",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          child: Container(
                              width: size.width,
                              height: size.height / 1.9,
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _column(label: "Date", value: "03.12.19"),
                                      _column(
                                          label: "Seat",
                                          value: "D6, D7",
                                          width: 100),
                                    ],
                                  ),
                                  SizedBox(height: 35.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _column(label: "Time", value: "11.00AM"),
                                      _column(
                                          label: "Price",
                                          value: "24\$",
                                          width: 100),
                                    ],
                                  ),
                                  SizedBox(height: 35.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _column(
                                          label: "Cinema", value: "AMC NP 12"),
                                      _column(
                                          label: "Order",
                                          value: "355128",
                                          width: 100),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                ],
                              )),
                        ),
                      ),
                      Positioned(
                          left: 0, right: 0, bottom: 20, child: FlipCard())
                    ]))),
          ]));
        });
  }

  Widget _column({String? label, String? value, double? width}) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label!,
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0)),
          SizedBox(height: 5),
          Text(value!,
              style: TextStyle(
                  color: Color(0xFF6E606D),
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0)),
        ],
      ),
    );
  }
}

class BackgroundVideo extends StatefulWidget {
  const BackgroundVideo({super.key});

  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  late VideoPlayerController _controller;

  void _controllerListener() {
    if (_controller.value.isInitialized) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset("assets/images/movie_ticket/frozen.mp4")
          ..setVolume(0)
          ..setLooping(true)
          ..initialize().then((value) {
            _controller.play();
            _controller.addListener(_controllerListener);
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Container(
            height: 400,
            color: color,
            child: buildVideo(),
          )
        : Container(color: color);
  }

  Widget buildVideo() {
    return AspectRatio(aspectRatio: 16 / 9, child: VideoPlayer(_controller));
  }
}
