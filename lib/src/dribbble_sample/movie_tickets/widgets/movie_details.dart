import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/models/movie_tickets_model.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/pages/movie_trailer_page.dart';

class MovieDetails extends StatelessWidget {
  
  const MovieDetails({
    super.key,
    required this.currentPage
  });

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Story', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0)),
        SizedBox(height: 10.0),
        Text(popularList[currentPage].story, 
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.grey.shade300, 
            fontWeight: FontWeight.w500, 
            fontSize: 14.0, 
            shadows: [
              Shadow(
                color: Colors.blue.shade900.withOpacity(1.0),
                offset: Offset(1.0, 1.0),
                blurRadius: 5.0,
              ),
            ]
          ),
        ),
        SizedBox(height: 20.0),
        Text('Characters', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0)),
        SizedBox(height: 15.0),
        Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularList[currentPage].charaters.length,
            itemBuilder: (context, index) {
              final item = popularList[currentPage].charaters[index];
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(item.image,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.charaterName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        Text(item.actorName, style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey.shade400)),
                      ],
                    ),
                  )
                ],
              );
            }
          ),
        ),
        SizedBox(height: 15.0),
        Text('Trailers and stills', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0)),
        SizedBox(height: 10.0),
        Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularList[currentPage].trailers.length,
            itemBuilder: (context, index) {
              final item = popularList[currentPage].trailers[index];
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(item.imageTrailer,
                        fit: BoxFit.fill,
                        width: 240,
                        height: 120,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 650),
                              pageBuilder: (context, animation, _) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: MovieTrailerPage(initialVideoId: item.initialVideoId),
                                );
                              }
                            )
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Icon(Icons.play_arrow, color: Colors.white, size: 45.0)
                        )
                      ),
                    )
                  ],
                ),
              );
            }
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}