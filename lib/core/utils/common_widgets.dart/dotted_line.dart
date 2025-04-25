import 'package:flutter/material.dart';

class DottedCircleLine extends StatelessWidget {
  final Axis direction;
  final double dotRadius;
  final double space;
  final Color color;
  final double length;

  const DottedCircleLine({
    super.key,
    this.direction = Axis.horizontal,
    this.dotRadius = 2,
    this.space = 4,
    this.color = Colors.black,
    this.length = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: direction == Axis.horizontal
          ? Size(length, dotRadius * 2)
          : Size(dotRadius * 2, length),
      painter: _DottedCircleLinePainter(
        direction: direction,
        dotRadius: dotRadius,
        space: space,
        color: color,
      ),
    );
  }
}

class _DottedCircleLinePainter extends CustomPainter {
  final Axis direction;
  final double dotRadius;
  final double space;
  final Color color;

  _DottedCircleLinePainter({
    required this.direction,
    required this.dotRadius,
    required this.space,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double offset = 0;
    while (offset < (direction == Axis.horizontal ? size.width : size.height)) {
      final dx = direction == Axis.horizontal ? offset : size.width / 2;
      final dy = direction == Axis.horizontal ? size.height / 2 : offset;
      canvas.drawCircle(Offset(dx, dy), dotRadius, paint);
      offset += dotRadius * 2 + space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DashedLine extends StatelessWidget {
  final Axis direction;
  final double dashLength;
  final double dashThickness;
  final double dashSpacing;
  final double length;
  final Color color;

  const DashedLine({
    super.key,
    this.direction = Axis.horizontal,
    this.dashLength = 10,
    this.dashThickness = 2,
    this.dashSpacing = 6,
    this.length = double.infinity,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: direction == Axis.horizontal
          ? Size(length, dashThickness)
          : Size(dashThickness, length),
      painter: _DashedLinePainter(
        direction: direction,
        dashLength: dashLength,
        dashSpacing: dashSpacing,
        dashThickness: dashThickness,
        color: color,
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Axis direction;
  final double dashLength;
  final double dashSpacing;
  final double dashThickness;
  final Color color;

  _DashedLinePainter({
    required this.direction,
    required this.dashLength,
    required this.dashSpacing,
    required this.dashThickness,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = dashThickness
      ..style = PaintingStyle.stroke;

    double offset = 0;
    final max = direction == Axis.horizontal ? size.width : size.height;

    while (offset < max) {
      final start = Offset(
        direction == Axis.horizontal ? offset : size.width / 2,
        direction == Axis.horizontal ? size.height / 2 : offset,
      );

      final end = Offset(
        direction == Axis.horizontal ? offset + dashLength : size.width / 2,
        direction == Axis.horizontal ? size.height / 2 : offset + dashLength,
      );

      canvas.drawLine(start, end, paint);
      offset += dashLength + dashSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
