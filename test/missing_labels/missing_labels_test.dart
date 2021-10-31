import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/cases/missing_labels.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_tests_utils/material_golden.dart';

void main() {
  screenTestGolden(
      tag: 'missing_labels',
      screenName: 'Missing Labels',
      skipTapTargetSizeGuideline: true,
      skipLabeledTapTargetGuideline: true,
      semanticPhoneHeight: 1000,
      builder: () {
        return const MissingLabelsPage();
      });

  testWidgets('Tap Target Label Guideline on MyWidget is KO', (WidgetTester tester) async {
    final widget = MaterialApp(builder: (context, child) {
      return const MissingLabelsPage();
    });

    await tester.pumpWidget(widget);

    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
  });
}
