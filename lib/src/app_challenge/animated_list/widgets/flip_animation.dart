import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/animation_type.dart';

class FlipAnimation extends StatelessWidget {
  final int index;
  final Curve curve;
  final Widget child;
  final Duration duration;
  final double speedFactor; // Factor de velocidad para ajustes más finos
  final AnimationDirection direction;

  FlipAnimation({
    super.key,
    required this.child,
    required this.index,
    required this.curve,
    required this.duration,
    required this.direction,
    required this.speedFactor,
  });

  @override
  Widget build(BuildContext context) {
    final isLeft = direction == AnimationDirection.left;

    return TweenAnimationBuilder(
      curve: curve,
      duration: duration * speedFactor, // Ajustar duración según speedFactor
      tween: Tween<double>(begin: -1.0, end: 0.0), // Rango para el flip
      builder: (context, value, child) {
        final flipAngle = value * pi / 2; // Rotación en radianes (90° a 0°)

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateY(flipAngle) // Rotación horizontal
            ..translate(
              isLeft ? -value * 100 : value * 100, // Movimiento adicional horizontal
              0,
              0,
            ),
          child: Opacity(
            opacity: (1.0 - value.abs()).clamp(0.5, 1.0), // Controlar opacidad
            child: value > -0.5
                ? child
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(pi), // Flip completo
                    child: child,
                  ),
          ),
        );
      },
      child: child,
    );
  }
}
