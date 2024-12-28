import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/disney_movies/models/disney_movies_model.dart';

class DisneyMoviesPage extends StatefulWidget {
  const DisneyMoviesPage({super.key});

  @override
  State<DisneyMoviesPage> createState() => _DisneyMoviesPageState();
}

class _DisneyMoviesPageState extends State<DisneyMoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWheelScrollView(
        itemExtent: 250,
        physics: FixedExtentScrollPhysics(),
        offAxisFraction: 1.5,
        children: [
          for (int i = 0; i < topMovies.length; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Container(
                      color: Colors.blue,
                      width: 150,
                      height: 200,
                      child: Image.asset(topMovies[i].image))),
            )
        ],
      ),
    );
  }
}
