import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_backdrop.dart';
import '../widgets/paper_card.dart';

class EditStudentPage extends StatefulWidget {
  const EditStudentPage({required this.initialName, super.key});

  final String initialName;

  @override
  State<EditStudentPage> createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _save() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama tidak boleh kosong')),
      );
      return;
    }
    Navigator.pop(context, name);
  }

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
                      'Edit nama',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: PaperCard(
                        padding: const EdgeInsets.all(22),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Perbarui nama mahasiswa',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Perubahan akan langsung terlihat di profil.',
                              style: TextStyle(color: AppColors.muted),
                            ),
                            const SizedBox(height: 22),
                            TextField(
                              controller: _nameController,
                              autofocus: true,
                              textCapitalization: TextCapitalization.words,
                              decoration: const InputDecoration(
                                labelText: 'Nama lengkap',
                                prefixIcon: Icon(Icons.person_outline_rounded),
                              ),
                              onSubmitted: (_) => _save(),
                            ),
                            const SizedBox(height: 18),
                            FilledButton(
                              onPressed: _save,
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.pink,
                                foregroundColor: const Color(0xFF111229),
                                minimumSize: const Size.fromHeight(52),
                              ),
                              child: const Text('Simpan perubahan'),
                            ),
                          ],
                        ),
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
