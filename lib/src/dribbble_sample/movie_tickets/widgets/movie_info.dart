import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/models/movie_tickets_model.dart';

class MovieInfo extends StatefulWidget {
  
  MovieInfo({
    super.key,
    required this.currentPage
  });

  final int currentPage;

  @override
  State<MovieInfo> createState() => MovieInfoState();
}

class MovieInfoState extends State<MovieInfo> {

  double _textPage = 0;
  late PageController _pageTextController;

  void _textScrollListener() {
    setState(() {
      _textPage = _pageTextController.page!;
    });
  }

  void updateStateFromExternal(int currentPage) {
    setState(() {
      //if (_pageTextController.hasClients) {
        _pageTextController.animateToPage(
          currentPage, 
          duration: Duration(milliseconds: 500), 
          curve: Curves.fastOutSlowIn
        );
      //}
    });
  }

  @override
  void initState() {
    print('init state ${widget.currentPage}');
    _pageTextController = PageController(initialPage: widget.currentPage);
    _pageTextController.addListener(_textScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageTextController.removeListener(_textScrollListener);
    _pageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: kToolbarHeight * 2.5,
      child: PageView.builder(
        padEnds: false,
        itemCount: popularList.length,
        scrollDirection: Axis.horizontal,
        controller: _pageTextController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final item = popularList[index];
          final opacity = (1 - (index - _textPage).abs()).clamp(0.0, 1.0);
          return Opacity(
            opacity: opacity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 2, color: Colors.grey.shade300)),
                      child: Text("IMDb", style: TextStyle(color: Colors.grey.shade300)),
                    ),
                    SizedBox(width: 8),
                    Text(item.imdb, style: TextStyle(color: Colors.grey.shade300, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(height: 5.0),
                Text(item.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
                SizedBox(height: 5.0),
                Text(item.actors, style: TextStyle(color: Colors.white)),
                SizedBox(height: 15.0),
              ],
            )
          );
        }
      ),
    );
  }
}