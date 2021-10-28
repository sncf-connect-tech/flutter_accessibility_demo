import 'package:flutter_accessibility_demo/cases/text_size.dart';
import 'package:golden_tests_utils/material_golden.dart';

void main() {
  // TODO charger une font
  screenTestGolden(
      tag: 'text_size',
      screenName: 'Text Size',
      skipTapTargetSizeGuideline: true,
      builder: () {
        return TextSizePage();
      });
}
