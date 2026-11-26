import 'package:flutter/material.dart';

import '../data/students.dart';
import '../models/student.dart';
import '../theme/app_theme.dart';
import '../widgets/paper_card.dart';
import '../widgets/student_avatar.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({required this.onStudentSelected, super.key});

  final ValueChanged<Student> onStudentSelected;

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final filteredStudents = students
        .where(
          (student) =>
              student.name.toLowerCase().contains(_query.toLowerCase()) ||
              student.nim.contains(_query),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Temukan teman seangkatan dan kenali perjalanan akademik mereka.',
                style: TextStyle(color: AppColors.muted, height: 1.45),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (value) => setState(() => _query = value.trim()),
                decoration: const InputDecoration(
                  hintText: 'Cari nama atau NIM',
                  prefixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: filteredStudents.isEmpty
              ? const Center(
                  child: Text(
                    'Mahasiswa tidak ditemukan',
                    style: TextStyle(color: AppColors.muted),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 22),
                  itemCount: filteredStudents.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final student = filteredStudents[index];
                    return _StudentCard(
                      student: student,
                      onTap: () => widget.onStudentSelected(student),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _StudentCard extends StatelessWidget {
  const _StudentCard({required this.student, required this.onTap});

  final Student student;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final accent = Color(student.accentColor);
    return PaperCard(
      padding: EdgeInsets.zero,
      borderRadius: 22,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(22),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Hero(
                  tag: student.id,
                  child: StudentAvatar(
                    studentName: student.name,
                    photoUrl: student.photoUrl,
                    accentColor: accent,
                    size: 62,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'NIM ${student.nim}',
                        style: const TextStyle(
                          color: AppColors.muted,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        student.program,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.greenText,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.muted,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
