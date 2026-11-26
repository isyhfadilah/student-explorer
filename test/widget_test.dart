import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_explorer/main.dart';

void main() {
  testWidgets('login, edit student name, and return to student list', (
    tester,
  ) async {
    await tester.pumpWidget(const StudentExplorerApp());

    await tester.tap(find.text('Masuk ke Student Explorer'));
    await tester.pumpAndSettle();
    expect(find.text('Halo, Aisyah!'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.groups_outlined));
    await tester.pumpAndSettle();
    expect(find.text('NIM 230001'), findsOneWidget);

    await tester.tap(find.text('Aisyah Putri'));
    await tester.pumpAndSettle();
    expect(find.text('Biodata'), findsOneWidget);
    expect(find.text('Akademik'), findsOneWidget);

    await tester.tap(find.byTooltip('Edit nama'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Aisyah Rahma');
    await tester.tap(find.text('Simpan perubahan'));
    await tester.pumpAndSettle();
    expect(find.text('Aisyah Rahma'), findsNWidgets(2));

    await tester.tap(find.byTooltip('Kembali'));
    await tester.pumpAndSettle();
    expect(find.text('Aisyah Rahma'), findsOneWidget);
  });

  testWidgets('drawer about and logout return to the login page', (
    tester,
  ) async {
    await tester.pumpWidget(const StudentExplorerApp());
    await tester.tap(find.text('Masuk ke Student Explorer'));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Buka menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();
    expect(find.text('Versi 1.0.0'), findsOneWidget);

    await tester.tap(find.byTooltip('Kembali'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Buka menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Logout'));
    await tester.pumpAndSettle();
    expect(find.text('Masuk ke Student Explorer'), findsOneWidget);
  });
}
