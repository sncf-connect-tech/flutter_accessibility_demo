import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/cases/tap_target_size.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_tests_utils/material_golden.dart';

void main() {
  testWidgets('Tap Target Size Guideline on TapTargetSizePage is OK', (WidgetTester tester) async {
    final widget = MaterialApp(builder: (context, child) {
      return const TapTargetSizePage();
    });

    await tester.pumpWidget(widget);

    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
  });

  screenTestGolden(
      tag: 'tap_target_size',
      screenName: 'Tap Target Size',
      builder: () {
        return const TapTargetSizePage();
      });
}
