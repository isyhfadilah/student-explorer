import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/paper_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
      children: [
        PaperCard(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
          child: Column(
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.green,
                  border: Border.all(color: AppColors.ink, width: 3),
                ),
                child: const Icon(
                  Icons.person_rounded,
                  color: Color(0xFF111229),
                  size: 54,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Aisyah Putri',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 5),
              const Text(
                'mahasiswa@kampus.ac.id',
                style: TextStyle(color: AppColors.muted),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: AppColors.green.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Sistem Informasi · Semester 5',
                  style: TextStyle(color: AppColors.ink, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        PaperCard(
          child: Column(
            children: [
              _ProfileInfo(
                icon: Icons.badge_outlined,
                label: 'NIM',
                value: '230001',
              ),
              Divider(height: 24, color: AppColors.ink.withValues(alpha: 0.16)),
              _ProfileInfo(
                icon: Icons.school_outlined,
                label: 'Program studi',
                value: 'Sistem Informasi',
              ),
              Divider(height: 24, color: AppColors.ink.withValues(alpha: 0.16)),
              _ProfileInfo(
                icon: Icons.auto_awesome_outlined,
                label: 'Status',
                value: 'Mahasiswa aktif',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.green),
        const SizedBox(width: 12),
        Expanded(
          child: Text(label, style: const TextStyle(color: AppColors.muted)),
        ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
