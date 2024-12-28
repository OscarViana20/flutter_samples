import 'package:flutter/material.dart';

class ScalePageRoute extends PageRouteBuilder {
  final Widget widget;
  final Size size;

  ScalePageRoute({required this.widget, required this.size})
      : super(
            transitionDuration: Duration(milliseconds: 300),
            reverseTransitionDuration: Duration(milliseconds: 300),
            transitionsBuilder: (context, animation1, animation2, child) {
              animation1 = CurvedAnimation(
                  parent: animation1,
                  curve: Interval(0.0, 1.0, curve: Curves.easeOutSine));
              return ScaleTransition(
                alignment: Alignment.bottomCenter,
                scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: TweenAnimationBuilder(
                  duration: Duration(milliseconds: 300),
                  tween: Tween<double>(begin: 150, end: 0),
                  builder: (BuildContext context, double value, Widget? child) {
                    return ClipRRect(
                      child: child,
                      borderRadius: BorderRadius.circular(value),
                    );
                  },
                  child: child,
                ),
              );
            },
            pageBuilder: (context, animation1, animation2) {
              return widget;
            });
}
