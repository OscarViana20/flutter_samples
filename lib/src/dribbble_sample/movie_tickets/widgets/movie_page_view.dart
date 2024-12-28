import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/models/movie_tickets_model.dart';

class MoviePageView extends StatefulWidget {

  MoviePageView({
    super.key,
    required this.viewportFraction,
    required this.onPageChanged
  });

  final double viewportFraction;
  final Function(int) onPageChanged;

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {

  int _currentPage = 0;
  late PageController _pageController;

  void _scrollListener() {
    setState(() { });
  }

  void _onPageChanged(value) {
    setState(() {
      if (value < popularList.length) {
        _currentPage = value;
        widget.onPageChanged.call(value);
      } else {
        _pageController.jumpToPage(value - 1);
      }
    });
  }

  @override
  void initState() {
    _pageController = PageController(viewportFraction: widget.viewportFraction, initialPage: _currentPage);
    _pageController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void didUpdateWidget(MoviePageView oldWidget) {
    _pageController = PageController(viewportFraction: widget.viewportFraction, initialPage: _currentPage);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _pageController.removeListener(_scrollListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(Color(0xFF0B0F14)),
      padding: EdgeInsets.only(top: kToolbarHeight * 2.0),
      child: PageView.builder(
        padEnds: false,
        itemCount: popularList.length + 2,
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: _onPageChanged,
        physics: widget.viewportFraction < 0.8 ? NeverScrollableScrollPhysics() : ScrollPhysics(),
        itemBuilder: (context, index) {
          if (index >= popularList.length)  {
            return const SizedBox.shrink();
          }
          final item = popularList[index];
          final paddingTop = (_currentPage == index ? 0.0 : 50.0) * widget.viewportFraction;
          return Padding(
            padding: EdgeInsets.fromLTRB(10.0, paddingTop, 10.0, 10.0),
            child: Opacity(
              opacity: _currentPage == index ? 1 : 0.5, 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.asset(item.image, fit: BoxFit.fill)
                    ),
                    if (_currentPage != index)...[                
                      Container(decoration: _boxDecoration(Colors.transparent))
                    ]
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  Decoration _boxDecoration(Color color) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          colors[_currentPage],
          color,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp
      ),
    );
  }
}