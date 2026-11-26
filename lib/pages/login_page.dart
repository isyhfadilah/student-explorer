import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_backdrop.dart';
import '../widgets/campus_mascot.dart';
import '../widgets/paper_card.dart';
import 'main_shell.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController(
    text: 'mahasiswa@kampus.ac.id',
  );
  final _passwordController = TextEditingController(text: 'student123');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(builder: (_) => const MainShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackdrop(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(22),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _BrandMark(),
                    const SizedBox(height: 22),
                    const Text(
                      'Hai, Aisyah!\nSiap jelajah',
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        height: 1.02,
                        letterSpacing: -1.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'kampus?',
                      style: TextStyle(
                        color: AppColors.greenText,
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        height: 1.05,
                        letterSpacing: -1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Temukan cerita seru teman-temanmu.',
                      style: TextStyle(color: AppColors.ink, fontSize: 15),
                    ),
                    const SizedBox(height: 4),
                    const Center(
                      child: SizedBox(
                        width: 112,
                        height: 85,
                        child: CampusMascot(),
                      ),
                    ),
                    const SizedBox(height: 2),
                    PaperCard(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Masuk ke komunitas',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email kampus',
                              prefixIcon: Icon(Icons.alternate_email_rounded),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Kata sandi',
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                            ),
                          ),
                          const SizedBox(height: 16),
                          FilledButton.icon(
                            onPressed: _login,
                            icon: const Icon(Icons.arrow_forward_rounded),
                            label: const Text('Masuk ke Student Explorer'),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Mode demo · data mahasiswa tersimpan lokal',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.muted,
                              fontSize: 11,
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
          ),
        ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 43,
          height: 43,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: AppColors.ink, width: 2),
          ),
          child: const Icon(
            Icons.school_rounded,
            color: AppColors.cream,
            size: 25,
          ),
        ),
        const SizedBox(width: 11),
        const Text(
          'STUDENT\nEXPLORER',
          style: TextStyle(
            color: AppColors.ink,
            fontSize: 13,
            fontWeight: FontWeight.w900,
            height: 1.04,
            letterSpacing: 1.1,
          ),
        ),
      ],
    );
  }
}
