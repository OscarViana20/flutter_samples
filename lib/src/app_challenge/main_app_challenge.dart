import 'package:flutter/material.dart';
import 'package:flutter_samples/src/app_challenge/play_station/home.dart';

import 'animated_list/animated_page.dart';

class MainAppChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text('App Challenge', style: TextStyle(color: Colors.black)),
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
  Route(title: 'Play station', page: Home()),
  Route(title: 'Animated List', page: AnimatedPage()),
];
