import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/cinema_concept/pages/cinema_concept_main.dart';
import 'package:flutter_samples/src/dribbble_sample/disney_movies/pages/disney_movies_page.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/pages/movie_tickets_page.dart';
import 'package:flutter_samples/src/dribbble_sample/saki/pages/saki_main_page.dart';

import 'bank_manager/pages/bank_manager_main.dart';
import 'shoe_store/pages/shoe_store_main.dart';

class MainDribbleSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text('Dribble Samples', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: routesList.length,
                itemBuilder: _buildButton,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: Color.fromRGBO(175, 160, 227, 1)),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => routesList[index].page,
            ),
          );
        },
        child: Text(routesList[index].title, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

class Route {
  Route({
    required this.title,
    required this.page,
  });
  final String title;
  final Widget page;
}

final routesList = <Route>[
  Route(title: 'Saki', page: SakiMainPage()),
  Route(title: 'Movie ticket', page: MovieTicketsPage()),
  Route(title: 'Disney movies', page: DisneyMoviesPage()),
  Route(title: 'Cinema concept', page: CinemaConceptMain()),
  Route(title: 'Shoe store', page: ShoeStoreMain()),
  Route(title: 'Bank manager', page: BankManagerMain())
];
