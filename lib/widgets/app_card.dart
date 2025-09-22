import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.margin = EdgeInsets.zero,
    this.elevation = 2,
    this.width = double.infinity,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double elevation;
  final double width;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);

    return Padding(
      padding: margin,
      child: SizedBox(
        width: width,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: elevation,
          shape: RoundedRectangleBorder(borderRadius: radius),
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
