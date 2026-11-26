import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_backdrop.dart';
import '../widgets/paper_card.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackdrop(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 20, 8),
                child: Row(
                  children: [
                    IconButton(
                      tooltip: 'Kembali',
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    const Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: PaperCard(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.school_rounded,
                            color: AppColors.green,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Student Explorer',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Aplikasi komunitas kampus untuk menjelajahi profil, '
                            'biodata, dan ringkasan akademik mahasiswa. '
                            'Dibuat sebagai demo Flutter dengan data lokal.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.muted,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            'Versi 1.0.0',
                            style: TextStyle(
                              color: AppColors.ink,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
