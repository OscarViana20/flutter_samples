import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/saki/constants/colors.dart';

class SakiSettingsPage extends StatefulWidget {
  @override
  _SakiSettingsPageState createState() => _SakiSettingsPageState();
}

class _SakiSettingsPageState extends State<SakiSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Stack(
              children: [Positioned(bottom: 0, child: _buildPanel(context))],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPanel(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        tween: Tween(begin: 1.0, end: 0.0),
        child: Stack(
          children: [
            Container(
              height: size.height * 0.55,
              width: size.width,
              decoration: BoxDecoration(
                  color: buttons,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.folder, color: Colors.white),
                        Icon(Icons.menu_book, color: Colors.white),
                        Icon(Icons.person_sharp, color: Colors.white),
                        Icon(Icons.person_sharp, color: Colors.white)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * 0.45,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Avenir',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        builder: (context, value, child) {
          return Transform.translate(
              offset: Offset(0.0, value * size.height * 0.55), child: child);
        });
  }
}
