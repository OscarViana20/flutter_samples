import 'package:flutter/material.dart';

import '../constants/animation_type.dart';

class FadeAnimation extends StatelessWidget {
  final int index;
  final Curve curve;
  final Widget child;
  final Duration duration;
  final double speedFactor; // Factor de velocidad para ajustes más finos
  final AnimationDirection direction;

  FadeAnimation({
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
    final initialOffset = isLeft ? -50.0 : 50.0;

    return TweenAnimationBuilder(
      curve: curve,
      duration: duration * speedFactor, // Ajustar duración según speedFactor
      tween: Tween<double>(begin: 1.0, end: 0.0), // Rango para el fade
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(initialOffset * value, 0), // Movimiento sutil
          child: Opacity(
            opacity: (1.0 - value).clamp(0.0, 1.0), // Controlar opacidad
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
