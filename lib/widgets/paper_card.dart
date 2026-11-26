import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class PaperCard extends StatelessWidget {
  const PaperCard({
    required this.child,
    this.padding = const EdgeInsets.all(18),
    this.borderRadius = 22,
    this.color = AppColors.cream,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: AppColors.ink, width: 1.6),
      ),
      child: child,
    );
  }
}
