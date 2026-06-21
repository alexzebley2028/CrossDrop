import 'package:crossdrop/app/widgets/send_text_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('returns entered text and disposes its controller cleanly', (
    tester,
  ) async {
    String? captured;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                captured = await promptForSendText(context);
              },
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'https://example.com');
    await tester.tap(find.text('Continue'));
    // pumpAndSettle runs the dialog's exit animation to completion — the exact
    // window where disposing the controller too early used to throw.
    await tester.pumpAndSettle();

    expect(captured, 'https://example.com');
    expect(tester.takeException(), isNull);
  });

  testWidgets('returns null when cancelled', (tester) async {
    String? captured = 'sentinel';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                captured = await promptForSendText(context);
              },
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(captured, isNull);
    expect(tester.takeException(), isNull);
  });
}
