import 'package:flutter/material.dart';

class ScrollableTabView extends StatelessWidget {
  final List<Widget> children;
  final int selectedIndex;

  const ScrollableTabView({
    super.key,
    required this.children,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      width: double.infinity,
      child: children[selectedIndex],
    );
  }
}
