import 'package:flutter/material.dart';
//import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/movie_details.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/movie_times.dart';

class MovieDetailsTime extends StatefulWidget {
  MovieDetailsTime({super.key, required this.currentPage});

  final int currentPage;

  @override
  _MovieDetailsTimeState createState() => _MovieDetailsTimeState();
}

const Color _colorButtons = Color(0xFF5E01FF);

class _MovieDetailsTimeState extends State<MovieDetailsTime> {
  final borderRadius = BorderRadius.circular(12);

  final shadows = [
    BoxShadow(
      color: _colorButtons.withOpacity(0.5),
      blurRadius: 20,
      spreadRadius: 5,
      offset: Offset(0, 5), // Shadow position
    )
  ];

  int selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: kToolbarHeight,
            decoration:
                BoxDecoration(color: Colors.white, borderRadius: borderRadius),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _button(textButton: 'Details', currentIndex: 0),
                _button(textButton: 'Showtimes', currentIndex: 1),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 850,
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              children: [
                MovieDetails(currentPage: widget.currentPage),
                MovieTimes(currentPage: widget.currentPage),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _button({String? textButton, int? currentIndex}) {
    return Flexible(
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: () {
          if (selectedIndex != currentIndex) {
            setState(() {
              selectedIndex = currentIndex!;
              _pageController.jumpToPage(selectedIndex);
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: selectedIndex == currentIndex ? _colorButtons : null,
            borderRadius: borderRadius,
            boxShadow: selectedIndex == currentIndex ? shadows : [],
          ),
          child: Center(
            child: Text(
              textButton!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == currentIndex
                    ? Colors.white
                    : Colors.grey.shade400,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
