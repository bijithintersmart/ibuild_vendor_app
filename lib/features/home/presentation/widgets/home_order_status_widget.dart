import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'dart:ui';

import 'package:ibuild_vendor/core/theme/app_colors.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        childAspectRatio: 1.3,
        children: [
          GestureDetector(
            onTap: () {
              navController.jumpToTab(2);
              if (tabController != null) {
                tabController?.animateTo(
                  0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn,
                );
              }
            },
            child: StatusCard(
              title: "Pending",
              count: "15",
              subtitle: "Total pending orders",
              color: AppColors.secondary,
            ),
          ),
          GestureDetector(
            onTap: () {
              navController.jumpToTab(2);
              if (tabController != null) {
                tabController?.animateTo(
                  1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn,
                );
              }
            },
            child: StatusCard(
              title: "Confirmed",
              count: "70",
              subtitle: "Total confirmed orders",
              color: AppColors.secondary,
            ),
          ),
          GestureDetector(
            onTap: () {
              navController.jumpToTab(2);
              if (tabController != null) {
                tabController?.animateTo(
                  2,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn,
                );
              }
            },
            child: StatusCard(
              title: "Payment Complete",
              count: "20",
              subtitle: "Total inline orders",
              color: AppColors.secondary,
            ),
          ),
          StatusCard(
            title: "Service Completed",
            count: "100",
            subtitle: "Total completed orders",
            color: AppColors.secondary,
          ),
        ],
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final String title;
  final String count;
  final String subtitle;
  final Color color;

  const StatusCard({
    super.key,
    required this.title,
    required this.count,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15), 
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      foregroundDecoration: DashedBorderDecoration(
        color: color.withOpacity(0.7),
        strokeWidth: 1.5,
        dashLength: 6,
        dashGap: 3,
        borderRadius: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          Text(
            count,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,fontSize: 40,
                  color: color,
                ),
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey[700],
                ),
          ),
        ],
      ),
    );
  }
}

// Custom decoration for drawing dashed borders
class DashedBorderDecoration extends Decoration {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double dashGap;
  final double borderRadius;

  const DashedBorderDecoration({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.dashGap,
    required this.borderRadius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DashedBorderPainter(
      color: color,
      strokeWidth: strokeWidth,
      dashLength: dashLength,
      dashGap: dashGap,
      borderRadius: borderRadius,
    );
  }
}

class _DashedBorderPainter extends BoxPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double dashGap;
  final double borderRadius;

  _DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.dashGap,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = _createPath(rect, borderRadius);
    canvas.drawPath(_dashPath(path, dashLength, dashGap), paint);
  }

  Path _createPath(Rect rect, double radius) {
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          rect,
          Radius.circular(radius),
        ),
      );
  }

  Path _dashPath(Path originalPath, double dashLength, double dashGap) {
    final Path dashPath = Path();
    double distance = 0.0;
    bool draw = true;

    for (PathMetric pathMetric in originalPath.computeMetrics()) {
      while (distance < pathMetric.length) {
        double len = dashLength;
        if (distance + dashLength > pathMetric.length) {
          len = pathMetric.length - distance;
        }
        if (draw) {
          dashPath.addPath(
              pathMetric.extractPath(distance, distance + len,
                  startWithMoveTo: true),
              Offset.zero);
        }
        distance += dashLength + dashGap;
        draw = !draw;
      }
    }

    return dashPath;
  }
}
