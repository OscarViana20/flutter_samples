import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/movie_details_times.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/movie_info.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/movie_page_view.dart';

class MovieTicketsPage extends StatefulWidget {

  @override
  _MovieTicketsPageState createState() => _MovieTicketsPageState();
}

class _MovieTicketsPageState extends State<MovieTicketsPage> {

  int _currentPage = 0;

  final GlobalKey<MovieInfoState> _movieInfoKey = GlobalKey();

  void _onPageChanget(int currentPage) {
    setState(() {
      _currentPage = currentPage;
      _movieInfoKey.currentState?.updateStateFromExternal(currentPage);      
    });
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      backgroundColor: Color(0xFF0B0F14),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: _AppBarMovieTicket(
                  constraints: constraints,
                  onPageChanged: _onPageChanget
                )
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    MovieInfo(key: _movieInfoKey, currentPage: _currentPage),
                    MovieDetailsTime(currentPage: _currentPage)
                  ]
                )
              ),
            ],
          );
        }
      ),
    );
  }
}

class _AppBarMovieTicket extends SliverPersistentHeaderDelegate {
  
  const _AppBarMovieTicket({
    required this.constraints,
    required this.onPageChanged
  }); 

  final BoxConstraints constraints;
  final Function(int) onPageChanged;

  @override
  double get maxExtent => constraints.maxHeight * 0.75;

  @override
  double get minExtent => constraints.maxHeight * 0.40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double viewportFraction = max(0.45, 0.8 - (shrinkOffset / constraints.maxHeight));
    return Stack(
      children: [
        MoviePageView(
          viewportFraction: viewportFraction,
          onPageChanged: onPageChanged,
        ),
        SizedBox(
          height: constraints.maxHeight * 0.15,
          child: ListView(
            padding: EdgeInsets.only(top: kToolbarHeight, left: 20, right: 20),
            scrollDirection: Axis.horizontal,
            children: [
              Text('Popular Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28 * viewportFraction + 15)),
              SizedBox(width: 40),
              Text('Notifications', style: TextStyle(color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold, fontSize: 20 * viewportFraction + 15))
            ],
          ),
        ),
      ],
    );
  }
}