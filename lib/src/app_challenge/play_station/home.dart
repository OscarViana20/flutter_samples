import 'package:flutter/material.dart';
import 'package:flutter_samples/src/app_challenge/play_station/pages/play_station_page.dart';
import 'package:flutter_samples/src/app_challenge/play_station/widgets/drawer.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double xOffSet = 0;
  double yOffSet = 0;
  bool isDrawerOpen = false;

  void _translationForward() {
    setState(() {
      this.xOffSet = this.isDrawerOpen ? 0 : MediaQuery.of(context).size.width / 2;
      this.yOffSet = this.isDrawerOpen ? 0 : 50;
      this.isDrawerOpen = !this.isDrawerOpen;      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerWidget(),
          AnimatedContainer(
            transform: Matrix4
              .translationValues(this.xOffSet, this.yOffSet, 0)
              ..scale(this.isDrawerOpen ? 0.90 : 1.00),
            duration: const Duration(milliseconds: 100),
            height: double.infinity,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: this.isDrawerOpen ? BorderRadius.circular(30) : BorderRadius.zero,
              child: PlayStationPage(function: _translationForward)
            )
          )
        ],
      ),
    );
  }
}