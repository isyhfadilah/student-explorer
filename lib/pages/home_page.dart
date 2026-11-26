import 'package:flutter/material.dart';

import '../data/students.dart';
import '../models/student.dart';
import '../theme/app_theme.dart';
import '../widgets/campus_mascot.dart';
import '../widgets/paper_card.dart';
import '../widgets/student_avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.onExploreStudents,
    required this.onStudentSelected,
    super.key,
  });

  final VoidCallback onExploreStudents;
  final ValueChanged<Student> onStudentSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Halo, Aisyah!',
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.8,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Jelajahi komunitas kampusmu.',
            style: TextStyle(color: AppColors.muted, fontSize: 14),
          ),
          const SizedBox(height: 20),
          PaperCard(
            color: AppColors.pink,
            padding: const EdgeInsets.all(18),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final mascotWidth = constraints.maxWidth < 290
                    ? 98.0
                    : constraints.maxWidth < 350
                    ? 118.0
                    : 148.0;
                final mascotHeight = mascotWidth * 145 / 190;

                return SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: mascotWidth + 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Teman baru,\ncerita baru.',
                              style: TextStyle(
                                color: AppColors.ink,
                                fontSize: 27,
                                fontWeight: FontWeight.w900,
                                height: 1.04,
                                letterSpacing: -0.7,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${students.length} profil mahasiswa menunggu untuk dijelajahi.',
                              style: const TextStyle(
                                color: AppColors.ink,
                                fontSize: 14,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 16),
                            FilledButton.icon(
                              onPressed: onExploreStudents,
                              icon: const Icon(Icons.arrow_forward_rounded),
                              label: const Text('Jelajahi'),
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.cream,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: SizedBox(
                          width: mascotWidth,
                          height: mascotHeight,
                          child: const CampusMascot(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(
                child: Text(
                  'Mahasiswa',
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              TextButton(
                onPressed: onExploreStudents,
                child: const Text(
                  'Lihat semua',
                  style: TextStyle(
                    color: AppColors.greenText,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ...students
              .take(3)
              .map(
                (student) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _StudentPreview(
                    student: student,
                    onTap: () => onStudentSelected(student),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

class _StudentPreview extends StatelessWidget {
  const _StudentPreview({required this.student, required this.onTap});

  final Student student;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      padding: EdgeInsets.zero,
      borderRadius: 18,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                StudentAvatar(
                  studentName: student.name,
                  photoUrl: student.photoUrl,
                  accentColor: Color(student.accentColor),
                  size: 52,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.name,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${student.nim} · ${student.program}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.muted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, size: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
