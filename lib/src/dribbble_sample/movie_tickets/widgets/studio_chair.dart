import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudioChair {

  static Widget greyChair() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[800]),
        child: SvgPicture.asset("assets/images/movie_ticket/chair-light.svg"),
      ),
    );
  }

  static Widget redChair() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red[900],
        ),
        child: SvgPicture.asset("assets/images/movie_ticket/chair-light.svg"),
      ),
    );
  }

  static Widget whiteChair() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        decoration: BoxDecoration(color: Colors.brown[100]),
        child: SvgPicture.asset("assets/images/movie_ticket/chair-dark.svg"),
      ),
    );
  }

  static Widget purpleChair() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        decoration: BoxDecoration(color: Color(0xFF5E01FF)),
        child: SvgPicture.asset("assets/images/movie_ticket/chair-dark.svg"),
      ),
    );
  }
}