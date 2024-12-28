import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/cinema_concept/models/cinema_concept_model.dart';

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final Movie movie;
  final String title;

  SliverCustomHeaderDelegate({
    required this.collapsedHeight,
    required this.expandedHeight,
    required this.paddingTop,
    required this.movie,
    required this.title,
  });

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          Container(
              child: Stack(children: [
            Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: Image.asset(movie.backgroud!, fit: BoxFit.fill)),
            Positioned(
                width: size.width,
                height: kToolbarHeight * 1.5,
                bottom: 0,
                child: Container(
                    decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF222222),
                        spreadRadius: 30,
                        blurRadius: 30),
                  ],
                ))),
            Positioned(
                bottom: 0,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: size.width / 3,
                          child: Text(movie.description,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 2.0),
                                child: Text('3D',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12))),
                          ),
                          SizedBox(width: 5.0),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 2.0),
                                child: Text('IMAX',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12))),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ])),
          // Put your head back
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this
                  .makeStickyHeaderBgColor(shrinkOffset), // Background color
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: this.collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: this.makeStickyHeaderTextColor(
                              shrinkOffset, true), // Return icon color
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        this.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: this.makeStickyHeaderTextColor(
                              shrinkOffset, false), // Title color
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: this.makeStickyHeaderTextColor(
                              shrinkOffset, true), // Share icon color
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
