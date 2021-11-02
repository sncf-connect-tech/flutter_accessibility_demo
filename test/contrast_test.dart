import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/cases/contrast.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Contrast Guideline on ContrastPage is OK', (WidgetTester tester) async {
    final widget = MaterialApp(builder: (context, child) {
      return const ContrastPage(
        isContrastOk: true,
      );
    });

    await tester.pumpWidget(widget);

    await expectLater(tester, meetsGuideline(textContrastGuideline));
  });
  testWidgets('Contrast Guideline on ContrastPage is KO', (WidgetTester tester) async {
    final widget = MaterialApp(builder: (context, child) {
      return const ContrastPage(
        isContrastOk: false,
      );
    });

    await tester.pumpWidget(widget);

    await expectLater(tester, meetsGuideline(textContrastGuideline));
  });
}
