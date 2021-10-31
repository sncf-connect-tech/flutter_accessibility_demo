import 'package:flutter_accessibility_demo/cases/missing_labels.dart';
import 'package:golden_tests_utils/material_golden.dart';

void main() {
  screenTestGolden(
      tag: 'missing_labels',
      screenName: 'Missing Labels',
      skipTapTargetSizeGuideline: true,
      semanticPhoneHeight: 1000,
      builder: () {
        return const MissingLabelsPage();
      });
}
