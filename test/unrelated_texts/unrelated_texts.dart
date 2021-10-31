import 'package:flutter_accessibility_demo/cases/unrelated_texts.dart';
import 'package:golden_tests_utils/material_golden.dart';

void main() {
  screenTestGolden(
      tag: 'unrelated_texts',
      screenName: 'Unrelated Texts',
      skipTapTargetSizeGuideline: true,
      skipLabeledTapTargetGuideline: true,
      builder: () {
        return const UnrelatedTextsPage();
      });
}
