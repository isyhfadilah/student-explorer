import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppBackdrop extends StatelessWidget {
  const AppBackdrop({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: AppColors.background, child: child);
  }
}
