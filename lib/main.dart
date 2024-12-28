import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/src/app_challenge/main_app_challenge.dart';
import 'package:flutter_samples/src/dribbble_sample/main_dribble_sample.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.red,
        ),
      ),
      initialRoute: '/',
      routes: getApplicationRoutes(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Flutter Samples',
          style: TextStyle(color: Colors.black),
        ),
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
        onPressed: () => Navigator.pushNamed(context, routesList[index].route),
        child: Text(routesList[index].title, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

class Route {
  Route({
    required this.title,
    required this.route,
  });
  final String title;
  final String route;
}

final routesList = <Route>[
  Route(title: 'Dribbble Samples', route: 'dribble'),
  Route(title: 'App Challenge', route: 'challenge')
];

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'dribble': (BuildContext context) => MainDribbleSample(),
    'challenge': (BuildContext context) => MainAppChallenge(),
  };
}
