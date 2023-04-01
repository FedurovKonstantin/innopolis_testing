import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inno_testing/widget.dart';

void main() {
  testWidgets('MyWidget has a title and message', (tester) async {
    await tester.pumpWidget(
      const MyWidget(title: 'T', message: 'M'),
    );

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('MyWidget has message key', (tester) async {
    await tester.pumpWidget(
      const MyWidget(title: 'T', message: 'M'),
    );
    final finder = find.byKey(const Key('message'));

    expect(finder, findsOneWidget);
  });

  testWidgets('MyWidget text visibility', (tester) async {
    await tester.pumpWidget(
      const MyWidget(title: 'T', message: 'M'),
    );

    // Expect to find the item on screen.
    expect(find.byKey(Key('visible')), findsNothing);

    await tester.tap(find.byType(FloatingActionButton));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Expect to find the item on screen.
    expect(find.byKey(Key('visible')), findsOneWidget);
  });
}
