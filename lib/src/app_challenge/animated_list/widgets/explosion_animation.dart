import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/animation_type.dart';

class ExplosionAnimation extends StatelessWidget {
  ExplosionAnimation({
    required this.index,
    required this.child,
    required this.curve,
    required this.duration,
    required this.direction,
    required this.speedFactor,
  });
  final int index;
  final Curve curve;
  final Widget child;
  final Duration duration;
  final double speedFactor;
  final AnimationDirection direction;

  @override
  Widget build(BuildContext context) {
    // Semilla aleatoria basada en el índice para consistencia
    final random = Random(index);

    // Angulo base de acuerdo a la dirección
    final baseAngle = direction == AnimationDirection.left ? pi : 0;

    return TweenAnimationBuilder(
      curve: curve,
      duration: duration * speedFactor,
      tween: Tween<double>(begin: 0.0, end: 1.0), // Progresión de la animación
      builder: (context, value, child) {
        // Ángulo y distancia aleatorios para movimiento inicial
        final angle = baseAngle + random.nextDouble() * pi / 6; 
        final maxDistance = 50.0; // Distancia máxima de desplazamiento
        final xOffset = maxDistance * cos(angle) * (1 - value); // Movimiento en X
        final yOffset = maxDistance * sin(angle) * (1 - value); // Movimiento en Y

        return Transform(
          transform: Matrix4.identity()
            ..translate(
              xOffset, // Movimiento hacia afuera y luego regresa
              yOffset,
            )
            ..scale(value.clamp(0.8, 1.2)), // Escala dinámica durante la animación
          child: Opacity(
            opacity: value.clamp(0.5, 1.0), // Aumenta opacidad gradualmente
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
