import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/utils/app_utils/extension.dart';
import 'package:lottie/lottie.dart';

class AppEmptyState extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? animationPath;
  final double animationWidth;
  final double animationHeight;
  final VoidCallback? onActionPressed;
  final String? actionButtonText;
  final bool disableHeight;

  const AppEmptyState({
    super.key,
    this.title,
    this.subtitle,
    this.animationPath,
    this.animationWidth = 250,
    this.animationHeight = 250,
    this.onActionPressed,
    this.disableHeight = false,
    this.actionButtonText,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTitle = _getRandomTitle();
    final defaultSubtitle = _getRandomSubtitle();
    if (disableHeight) {
      return LoaderLayout(
          animationPath: animationPath,
          animationWidth: animationWidth,
          animationHeight: animationHeight,
          title: title,
          defaultTitle: defaultTitle,
          subtitle: subtitle,
          defaultSubtitle: defaultSubtitle,
          onActionPressed: onActionPressed,
          actionButtonText: actionButtonText);
    }
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        height: context.screenHeight * 0.8,
        child: LoaderLayout(
            animationPath: animationPath,
            animationWidth: animationWidth,
            animationHeight: animationHeight,
            title: title,
            defaultTitle: defaultTitle,
            subtitle: subtitle,
            defaultSubtitle: defaultSubtitle,
            onActionPressed: onActionPressed,
            actionButtonText: actionButtonText),
      ),
    );
  }

  String _getRandomTitle() {
    final titles = [
      "Battery Empty, Just Like This Screen!",
      "No Power Banks In Sight",
      "Charging Station Taking a Break",
      "Power Search Came Up Empty",
      "Out of Juice Here Too",
      "Looks Like We're Low on Power",
      "Power Banks Gone Wandering",
      "The Case of the Missing Power Banks",
    ];

    return titles[DateTime.now().millisecond % titles.length];
  }

  String _getRandomSubtitle() {
    final subtitles = [
      "Don't worry, we're recharging our inventory as we speak.",
      "Unlike your phone, we can actually fix this empty situation.",
      "Our power banks must be out powering someone else's adventure.",
      "Try a different location or check back when the power banks return home.",
      "Even power banks need a rest sometimes. They'll be back soon!",
      "Seems like everyone's charging up today. Try again in a bit.",
      "We're hunting for some power banks to rescue your battery.",
      "The good news: we have power banks. The bad news: not right here, right now.",
    ];

    return subtitles[DateTime.now().millisecond % subtitles.length];
  }
}

class LoaderLayout extends StatelessWidget {
  const LoaderLayout({
    super.key,
    required this.animationPath,
    required this.animationWidth,
    required this.animationHeight,
    required this.title,
    required this.defaultTitle,
    required this.subtitle,
    required this.defaultSubtitle,
    required this.onActionPressed,
    required this.actionButtonText,
  });

  final String? animationPath;
  final double animationWidth;
  final double animationHeight;
  final String? title;
  final String defaultTitle;
  final String? subtitle;
  final String defaultSubtitle;
  final VoidCallback? onActionPressed;
  final String? actionButtonText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              animationPath ?? 'assets/lotties/empty.json',
              width: animationWidth,
              height: animationHeight,
              fit: BoxFit.fill,
              repeat: false,
            ),
            const SizedBox(height: 24),
            Text(
              title ?? defaultTitle,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              subtitle ?? defaultSubtitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[500],
                  ),
              textAlign: TextAlign.center,
            ),
            if (onActionPressed != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onActionPressed,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(actionButtonText ?? 'Find Power Banks'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
