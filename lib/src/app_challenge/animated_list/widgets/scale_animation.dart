import 'package:flutter/material.dart';

class ScaleAnimation extends StatelessWidget {
  final int index;
  final Curve curve;
  final Widget child;
  final Duration duration;
  final double speedFactor;

  ScaleAnimation({
    super.key,
    required this.child,
    required this.index,
    required this.curve,
    required this.duration,
    required this.speedFactor,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: curve,
      duration: duration * speedFactor, // Ajustar duración según speedFactor
      tween: Tween<double>(begin: 0.5, end: 1.0), // Escala inicial a final
      builder: (context, value, child) {
        return Transform.scale(
          scale: value, // Aplicar escala progresiva
          child: Opacity(
            opacity: value.clamp(0.5, 1.0), // Ajustar opacidad progresiva
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
