import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  testWidgets('Golden test', (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            key: const ValueKey('container'),
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ),
    ));

    await expectLater(
      find.byKey(const ValueKey('container')),
      matchesGoldenFile('goldens/golden_test.png'),
    );
  });
}
