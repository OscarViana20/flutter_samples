import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/animation_type.dart';

class CircularAnimation extends StatelessWidget {
  final int index;
  final Curve curve;
  final Widget child;
  final Duration duration;
  final double speedFactor; // Factor de velocidad para ajustes más finos
  final AnimationDirection direction;

  CircularAnimation({
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
    // Inicialización del ángulo según la dirección (180 - izq, 0 - der)
    double angleOffset = direction == AnimationDirection.left ? pi : 0.0;

    return TweenAnimationBuilder(
      curve: curve,
      duration: duration * speedFactor, // Ajustar duración según speedFactor
      tween: Tween<double>(begin: 0.0, end: 1.0), // De 0 a 1
      builder: (context, value, child) {
        // Calcular la posición en el círculo (en coordenadas polares)
        final radius = 100.0; // Radio del círculo
        final angle = angleOffset + (value * pi); // Movimiento circular entre 0 y 180 grados

        final offsetX = radius * cos(angle);  // Desplazamiento en X
        final offsetY = radius * sin(angle);  // Desplazamiento en Y

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(offsetX / radius, offsetY) // Movimiento circular centrado en pantalla
            ..scale(1.0) // Mantener el tamaño final como 1
            ..rotateZ(value * 2 * pi), // Rotación continua
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),  // Aumento de la opacidad de 0 a 1
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
