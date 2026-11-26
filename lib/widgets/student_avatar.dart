import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class StudentAvatar extends StatelessWidget {
  const StudentAvatar({
    required this.studentName,
    required this.photoUrl,
    required this.accentColor,
    required this.size,
    super.key,
  });

  final String studentName;
  final String photoUrl;
  final Color accentColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.ink, width: 2),
      ),
      child: ClipOval(
        child: Image.network(
          photoUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _AvatarFallback(
            name: studentName,
            accentColor: accentColor,
          ),
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return _AvatarFallback(name: studentName, accentColor: accentColor);
          },
        ),
      ),
    );
  }
}

class _AvatarFallback extends StatelessWidget {
  const _AvatarFallback({required this.name, required this.accentColor});

  final String name;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final initials = name
        .split(' ')
        .take(2)
        .map((part) => part.isEmpty ? '' : part[0])
        .join();
    return ColoredBox(
      color: accentColor.withValues(alpha: 0.28),
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
            color: AppColors.ink,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
