import 'package:flutter/material.dart';
import '../constants/animation_type.dart';

class SpiralAnimation extends StatelessWidget {
  SpiralAnimation({
    super.key,
    required this.child,
    required this.index,
    required this.curve,
    required this.duration,
    required this.direction,
    required this.speedFactor, // Factor de velocidad para ajustes más finos
  });

  final int index;
  final Curve curve;
  final Widget child;
  final Duration duration;
  final double speedFactor; // Factor de velocidad para ajustes más finos
  final AnimationDirection direction;

  @override
  Widget build(BuildContext context) {
    // Determinar la dirección inicial de desplazamiento
    final offset = direction == AnimationDirection.left ? -300.0 : 300.0;

    return TweenAnimationBuilder(
      curve: curve,
      duration: duration * speedFactor, // Ajustar duración según speedFactor
      tween: Tween<double>(begin: 1.5, end: 0.0),
      builder: (context, value, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(
              value * offset,
              value * 50,
              value * 20,
            ) // Movimiento espiral
            ..rotateZ(value * 0.4), // Rotación
          child: Opacity(
            opacity: (1.0 - value.abs()).clamp(0.1, 1.0), // Controlar opacidad
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
