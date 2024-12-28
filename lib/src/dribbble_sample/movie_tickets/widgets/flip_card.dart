import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_svg/flutter_svg.dart';

class FlipCard extends StatefulWidget {
  FlipCard({super.key});

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> {
  bool isBack = true;
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flip,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: angle),
        duration: Duration(milliseconds: 300),
        builder: (_, val, __) {
          if (val >= (pi / 2)) {
            isBack = false;
          } else {
            isBack = true;
          }
          return Transform(
            //let's make the card flip by it's center
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(val),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: Container(
                height: 120,
                child: isBack
                    ? Image.asset(
                        "assets/images/movie_ticket/barcode_cover.jpg",
                        fit: BoxFit.cover,
                      )
                    : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..rotateY(
                              pi), // it will flip horizontally the container
                        child: SvgPicture.asset(
                          "assets/images/movie_ticket/barcode.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
