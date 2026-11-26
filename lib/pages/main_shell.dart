import 'package:flutter/material.dart';

import '../models/student.dart';
import '../theme/app_theme.dart';
import '../widgets/app_backdrop.dart';
import 'about_page.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'student_detail_page.dart';
import 'students_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  static const _titles = ['Home', 'Mahasiswa', 'Profile'];

  void _logout() {
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  void _openAbout() {
    Navigator.pop(context);
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(builder: (_) => const AboutPage()),
    );
  }

  Future<void> _openStudent(Student student) async {
    await Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (_) => StudentDetailPage(student: student),
      ),
    );
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(
        onExploreStudents: () => setState(() => _selectedIndex = 1),
        onStudentSelected: _openStudent,
      ),
      StudentsPage(onStudentSelected: _openStudent),
      const ProfilePage(),
    ];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: _AppDrawer(
        onHome: () {
          Navigator.pop(context);
          setState(() => _selectedIndex = 0);
        },
        onAbout: _openAbout,
        onLogout: _logout,
      ),
      body: AppBackdrop(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 28, 8),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.cream,
                        border: Border.all(color: AppColors.ink, width: 1.5),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: const Icon(
                        Icons.school_rounded,
                        color: AppColors.greenText,
                        size: 23,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'STUDENT EXPLORER',
                            style: TextStyle(
                              color: AppColors.ink,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.9,
                            ),
                          ),
                          Text(
                            _titles[_selectedIndex],
                            style: const TextStyle(
                              color: AppColors.muted,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      tooltip: 'Buka menu',
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.cream,
                        side: const BorderSide(color: AppColors.ink, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      icon: const Icon(Icons.menu_rounded),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: IndexedStack(index: _selectedIndex, children: pages),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(14, 14, 14, 8),
        decoration: BoxDecoration(
          color: AppColors.cream,
          border: Border.all(color: AppColors.ink, width: 1.5),
          borderRadius: BorderRadius.circular(22),
        ),
        clipBehavior: Clip.antiAlias,
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() => _selectedIndex = index);
          },
          backgroundColor: AppColors.cream,
          indicatorColor: AppColors.pink,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.groups_outlined),
              selectedIcon: Icon(Icons.groups_rounded),
              label: 'Mahasiswa',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  const _AppDrawer({
    required this.onHome,
    required this.onAbout,
    required this.onLogout,
  });

  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.cream,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
        side: BorderSide(color: AppColors.ink, width: 2),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.green,
                    child: Icon(Icons.school_rounded, color: AppColors.cream),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Student Explorer',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Campus community',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: AppColors.ink.withValues(alpha: 0.18)),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: onHome,
            ),
            ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text('About'),
              onTap: onAbout,
            ),
            const Spacer(),
            Divider(color: AppColors.ink.withValues(alpha: 0.18)),
            ListTile(
              leading: const Icon(
                Icons.logout_rounded,
                color: Color(0xFFD84C68),
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xFFD84C68),
                  fontWeight: FontWeight.w800,
                ),
              ),
              onTap: onLogout,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
