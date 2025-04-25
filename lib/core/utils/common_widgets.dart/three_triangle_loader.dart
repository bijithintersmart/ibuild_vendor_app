import 'dart:math' as math;

import 'package:flutter/material.dart';

class Arc extends CustomPainter {
  Arc._(
    this._color,
    this._strokeWidth,
    this._startAngle,
    this._sweepAngle,
  );

  final Color _color;
  final double _startAngle;
  final double _strokeWidth;
  final double _sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.height / 2,
    );

    const bool useCenter = false;
    final Paint paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = _strokeWidth;

    canvas.drawArc(rect, _startAngle, _sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  static Widget draw({
    required Color color,
    required double size,
    required double strokeWidth,
    required double startAngle,
    required double endAngle,
  }) =>
      SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: Arc._(
            color,
            strokeWidth,
            startAngle,
            endAngle,
          ),
        ),
      );
}

extension LoadingAnimationControllerX on AnimationController {
  T eval<T>(Tween<T> tween, {Curve curve = Curves.linear}) =>
      tween.transform(curve.transform(value));

  double evalDouble({
    double from = 0,
    double to = 1,
    double begin = 0,
    double end = 1,
    Curve curve = Curves.linear,
  }) {
    return eval(
      Tween<double>(begin: from, end: to),
      curve: Interval(begin, end, curve: curve),
    );
  }
}
class TwoRotatingArc extends StatefulWidget {
  final double size;
  final Color color;

  const TwoRotatingArc({
    super.key,
    required this.color,
    required this.size,
  });

  @override
  State<TwoRotatingArc> createState() => _TwoRotatingArcState();
}

class _TwoRotatingArcState extends State<TwoRotatingArc>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  final Cubic firstCurve = Curves.easeInQuart;
  final Cubic secondCurve = Curves.easeOutQuart;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final double strokeWidth = size / 20;
    final Color color = widget.color;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => Stack(
        children: <Widget>[
          Visibility(
            visible: _animationController.value <= 0.5,
            child: Transform.rotate(
              angle: _animationController.evalDouble(
                to: 3 * math.pi / 4,
                end: 0.5,
                curve: firstCurve,
              ),
              child: Arc.draw(
                  color: color,
                  size: size,
                  strokeWidth: strokeWidth,
                  startAngle: -math.pi / 2,
                  endAngle: _animationController.evalDouble(
                    from: math.pi / (size * size),
                    to: -math.pi / 2,
                    end: 0.5,
                    curve: firstCurve,
                  )),
            ),
          ),
          Visibility(
            visible: _animationController.value >= 0.5,
            child: Transform.rotate(
              angle: _animationController.evalDouble(
                from: math.pi / 4,
                to: math.pi,
                begin: 0.5,
                curve: secondCurve,
              ),
              child: Arc.draw(
                color: color,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                endAngle: _animationController.evalDouble(
                  from: math.pi / 2,
                  to: math.pi / (size * size),
                  begin: 0.5,
                  curve: secondCurve,
                ),
              ),
            ),
          ),

          ///
          ///second one
          ///
          ///
          Visibility(
            visible: _animationController.value <= 0.5,
            child: Transform.rotate(
              angle: _animationController.evalDouble(
                from: -math.pi,
                to: -math.pi / 4,
                end: 0.5,
                curve: firstCurve,
              ),
              child: Arc.draw(
                color: color,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                endAngle: _animationController.evalDouble(
                  from: math.pi / (size * size),
                  to: -math.pi / 2,
                  end: 0.5,
                  curve: firstCurve,
                ),
              ),
            ),
          ),
          Visibility(
            visible: _animationController.value >= 0.5,
            child: Transform.rotate(
              angle: _animationController.evalDouble(
                from: -3 * math.pi / 4,
                to: 0.0,
                begin: 0.5,
                end: 1.0,
                curve: secondCurve,
              ),
              child: Arc.draw(
                color: color,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                endAngle: _animationController.evalDouble(
                  from: math.pi / 2,
                  to: math.pi / (size * size),
                  begin: 0.5,
                  curve: secondCurve,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
