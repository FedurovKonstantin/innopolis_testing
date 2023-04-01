import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:integration_test/integration_test.dart';

import 'package:inno_testing/widget.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('tap on visible and check static content', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final titleFinder = find.text('Title');
      final messageFinder = find.text('Message');

      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));

      // Rebuild the widget after the state has changed.
      await tester.pump();

      // Expect to find the item on screen.
      expect(find.byKey(const Key('visible')), findsOneWidget);
    });
  });
}
