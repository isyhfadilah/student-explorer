import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const StudentExplorerApp());
}

class StudentExplorerApp extends StatelessWidget {
  const StudentExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Explorer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const LoginPage(),
    );
  }
}
