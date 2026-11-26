import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_explorer/theme/app_theme.dart';

double _contrastRatio(Color foreground, Color background) {
  final first = foreground.computeLuminance();
  final second = background.computeLuminance();
  final lighter = first > second ? first : second;
  final darker = first > second ? second : first;
  return (lighter + 0.05) / (darker + 0.05);
}

void main() {
  test('reading colors meet WCAG AA contrast on their intended surfaces', () {
    final pairs = [
      (AppColors.ink, AppColors.background),
      (AppColors.ink, AppColors.cream),
      (AppColors.ink, AppColors.pink),
      (AppColors.ink, AppColors.yellow),
      (AppColors.muted, AppColors.background),
      (AppColors.muted, AppColors.cream),
      (AppColors.greenText, AppColors.background),
      (AppColors.greenText, AppColors.cream),
    ];

    for (final (foreground, background) in pairs) {
      expect(
        _contrastRatio(foreground, background),
        greaterThanOrEqualTo(4.5),
        reason: 'Text contrast must be at least 4.5:1.',
      );
    }
  });
}
