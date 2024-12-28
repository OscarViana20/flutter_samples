import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/cinema_concept/models/cinema_concept_model.dart';
import 'package:flutter_samples/src/dribbble_sample/cinema_concept/pages/cinema_movie_detail.dart';

const color = Colors.black;

class CinemaMovie extends StatefulWidget {
  const CinemaMovie({super.key});

  @override
  State<CinemaMovie> createState() => _CinemaMovieState();
}

class _CinemaMovieState extends State<CinemaMovie>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late PageController _pageController;
  late AnimationController _animationController;

  int _currentPage = 0;

  void _pageListener() {
    setState(() {});
  }

  void _onPageChanged(value) {
    setState(() {
      _currentPage = value;
    });
  }

  void _onShowDetail(BuildContext context, Movie movie) async {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation1, _) {
          return FadeTransition(
            opacity: animation1,
            child: CinemaMovieDetail(movie: movie),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.9);
    _pageController.addListener(_pageListener);

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 1.0, curve: Curves.easeInOut)));

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();

    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.60,
              child: Image.asset(nowShowing[_currentPage].backgroud!,
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: size.height * 0.4,
              child: Container(
                  decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      color.withOpacity(0.3),
                      color.withOpacity(0.8),
                      color.withOpacity(1)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.7, 1],
                    tileMode: TileMode.clamp),
              ))),
          _customAppBar(size),
          _pageView(size)
        ],
      ),
    );
  }

  Widget _customAppBar(Size size) {
    return Positioned(
        top: kToolbarHeight / 1.7,
        left: 10,
        right: 10,
        child: Container(
          width: size.width,
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFa39766),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      child:
                          Icon(Icons.chevron_left_rounded, color: Colors.white),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFa39766),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(Icons.search, color: Colors.white),
                  ))
            ],
          ),
        ));
  }

  Widget _pageView(Size size) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Positioned(
            left: 0,
            right: 0,
            bottom: (1 - _animation.value) * -size.height,
            child: Container(
              height: size.height - 60,
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < nowShowing.length; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 130,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              child: Container(
                                color: Color(0xFF222222),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 30,
                            right: 30,
                            bottom: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.white, width: 2.0),
                                        ),
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 30,
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () =>
                                        _onShowDetail(context, nowShowing[i]),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Hero(
                                            tag: '${nowShowing[i].id}',
                                            child: Image.asset(
                                                nowShowing[i].image,
                                                fit: BoxFit.fill))),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(nowShowing[i].description,
                                      style: TextStyle(
                                          fontSize: 22.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.0, vertical: 2.0),
                                            child: Text('3D',
                                                style: TextStyle(
                                                    color: Colors.grey))),
                                      ),
                                      SizedBox(width: 5.0),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.0, vertical: 2.0),
                                            child: Text('IMAX',
                                                style: TextStyle(
                                                    color: Colors.grey))),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.watch_later_outlined,
                                          color: Color(0xFFa39766)),
                                      Text('2hr 11Min',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey)),
                                      Text('Action / Superheros',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                      'As Scott Land balances being both a Super Hero and a father. Hope van Dyne and Dr. Hank Pym present...',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.grey)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 30),
                                  child: Center(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: 250,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFa39766),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Text("Book Now",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          );
        });
  }
}
