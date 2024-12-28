import 'package:flutter/material.dart';

class DotMatrix extends StatelessWidget {
  final int rows;
  final int columns;
  final double dotSize;
  final double spacing;

  DotMatrix({
    required this.rows,
    required this.columns,
    required this.dotSize,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        columns * (dotSize + spacing),
        rows * (dotSize + spacing),
      ),
      painter: DotMatrixPainter(
        rows: rows,
        columns: columns,
        dotSize: dotSize,
        spacing: spacing,
      ),
    );
  }
}

class DotMatrixPainter extends CustomPainter {
  final int rows;
  final int columns;
  final double dotSize;
  final double spacing;

  DotMatrixPainter({
    required this.rows,
    required this.columns,
    required this.dotSize,
    required this.spacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < columns; col++) {
        double dx = col * (dotSize + spacing);
        double dy = row * (dotSize + spacing);
        canvas.drawCircle(Offset(dx, dy), dotSize / 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
