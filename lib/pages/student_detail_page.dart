import 'package:flutter/material.dart';

import '../models/student.dart';
import '../theme/app_theme.dart';
import '../widgets/app_backdrop.dart';
import '../widgets/paper_card.dart';
import '../widgets/student_avatar.dart';
import 'edit_student_page.dart';

class StudentDetailPage extends StatefulWidget {
  const StudentDetailPage({required this.student, super.key});

  final Student student;

  @override
  State<StudentDetailPage> createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends State<StudentDetailPage> {
  Future<void> _editName() async {
    final updatedName = await Navigator.push<String>(
      context,
      MaterialPageRoute<String>(
        builder: (_) => EditStudentPage(initialName: widget.student.name),
      ),
    );
    if (updatedName != null && mounted) {
      setState(() => widget.student.name = updatedName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final student = widget.student;
    final accent = Color(student.accentColor);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AppBackdrop(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4, 16, 8),
                  child: Row(
                    children: [
                      IconButton(
                        tooltip: 'Kembali',
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      const Expanded(
                        child: Text(
                          'Profil mahasiswa',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      IconButton(
                        tooltip: 'Edit nama',
                        onPressed: _editName,
                        icon: const Icon(Icons.edit_outlined),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  child: PaperCard(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Hero(
                          tag: student.id,
                          child: StudentAvatar(
                            studentName: student.name,
                            photoUrl: student.photoUrl,
                            accentColor: accent,
                            size: 88,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                student.name,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'NIM ${student.nim}',
                                style: const TextStyle(
                                  color: AppColors.muted,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                student.program,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.greenText,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PaperCard(
                    padding: EdgeInsets.zero,
                    borderRadius: 16,
                    child: const TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: AppColors.pink,
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      labelColor: AppColors.ink,
                      unselectedLabelColor: AppColors.muted,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(text: 'Biodata'),
                        Tab(text: 'Akademik'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: TabBarView(
                    children: [
                      _BiodataTab(student: student),
                      _AcademicTab(student: student),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BiodataTab extends StatelessWidget {
  const _BiodataTab({required this.student});

  final Student student;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
      children: [
        const Text(
          'Informasi pribadi',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        PaperCard(
          child: Column(
            children: [
              _InfoRow(
                icon: Icons.badge_outlined,
                label: 'Nama lengkap',
                value: student.name,
              ),
              Divider(
                height: 24,
                color: AppColors.ink.withValues(alpha: 0.16),
              ),
              _InfoRow(
                icon: Icons.numbers_rounded,
                label: 'Nomor induk mahasiswa',
                value: student.nim,
              ),
              Divider(
                height: 24,
                color: AppColors.ink.withValues(alpha: 0.16),
              ),
              _InfoRow(
                icon: Icons.account_balance_outlined,
                label: 'Program studi',
                value: student.program,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AcademicTab extends StatelessWidget {
  const _AcademicTab({required this.student});

  final Student student;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
      children: [
        const Text(
          'Ringkasan akademik',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _AcademicMetric(
                icon: Icons.menu_book_rounded,
                label: 'Semester',
                value: '${student.semester}',
                accent: AppColors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _AcademicMetric(
                icon: Icons.star_rounded,
                label: 'IPK',
                value: student.gpa.toStringAsFixed(2),
                accent: AppColors.pink,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        PaperCard(
          child: Row(
            children: [
              const Icon(Icons.trending_up_rounded, color: AppColors.green),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Terus jaga konsistensi belajar di semester ${student.semester}.',
                  style: const TextStyle(color: AppColors.muted, height: 1.45),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
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
        Icon(icon, color: AppColors.green, size: 21),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: AppColors.muted, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}

class _AcademicMetric extends StatelessWidget {
  const _AcademicMetric({
    required this.icon,
    required this.label,
    required this.value,
    required this.accent,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      padding: const EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: accent),
          const SizedBox(height: 18),
          Text(
            value,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 3),
          Text(label, style: const TextStyle(color: AppColors.muted)),
        ],
      ),
    );
  }
}
