import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/confirm_button.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/movie_dates.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/movie_room.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/movie_studio.dart';

class MovieTimes extends StatelessWidget {
  
  MovieTimes({
    super.key,
    required this.currentPage
  });

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MovieDates(currentPage: currentPage),
        _information(),
        MovieStudio(currentPage: currentPage),
        Expanded(child: MovieRoom(currentPage: currentPage)),
        ConfirmButton()
      ],
    );
  }

  Widget _information() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text("AMC NewPark 12", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(width: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xFF5E01FF)),
              child: Text("10min", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.white)),
            )
          ],
        ),
        Text("989 lifestyle St Malence, Califonia 19289", style: TextStyle(fontSize: 14, color: Colors.grey.shade300, fontWeight: FontWeight.w500)),
      ],
    );
  }

 }