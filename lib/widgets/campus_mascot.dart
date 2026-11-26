import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CampusMascot extends StatelessWidget {
  const CampusMascot({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(
      size: Size(190, 145),
      painter: _CampusMascotPainter(),
    );
  }
}

class _CampusMascotPainter extends CustomPainter {
  const _CampusMascotPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 190;
    canvas.save();
    canvas.scale(scale, size.height / 145);

    final outline = Paint()
      ..color = AppColors.ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final fill = Paint()
      ..color = AppColors.green
      ..style = PaintingStyle.fill;
    final blob = Path()
      ..moveTo(18, 123)
      ..cubicTo(5, 109, 12, 88, 27, 79)
      ..cubicTo(11, 61, 25, 41, 46, 42)
      ..cubicTo(50, 20, 72, 12, 88, 29)
      ..cubicTo(102, 9, 127, 17, 132, 40)
      ..cubicTo(155, 32, 174, 47, 166, 70)
      ..cubicTo(190, 82, 184, 107, 163, 116)
      ..cubicTo(161, 139, 137, 147, 118, 131)
      ..cubicTo(96, 149, 73, 138, 69, 125)
      ..cubicTo(48, 143, 27, 139, 18, 123)
      ..close();
    canvas.drawPath(blob, fill);
    canvas.drawPath(blob, outline);

    final eyeWhite = Paint()..color = AppColors.cream;
    final pupil = Paint()..color = AppColors.ink;
    final cheek = Paint()..color = AppColors.pink;
    canvas.drawOval(const Rect.fromLTWH(50, 77, 29, 21), eyeWhite);
    canvas.drawOval(const Rect.fromLTWH(108, 77, 29, 21), eyeWhite);
    canvas.drawOval(const Rect.fromLTWH(61, 75, 10, 25), pupil);
    canvas.drawOval(const Rect.fromLTWH(119, 75, 10, 25), pupil);
    canvas.drawCircle(const Offset(42, 109), 5, cheek);
    canvas.drawCircle(const Offset(148, 109), 5, cheek);

    final smile = Path()
      ..moveTo(84, 108)
      ..cubicTo(87, 124, 101, 127, 107, 108);
    canvas.drawPath(smile, outline);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
