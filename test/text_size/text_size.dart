import 'package:flutter_accessibility_demo/cases/text_size.dart';
import 'package:golden_tests_utils/material_golden.dart';

void main() {
  screenTestGolden(
      tag: 'text_size',
      screenName: 'Text Size',
      skipTapTargetSizeGuideline: true,
      builder: () {
        return const TextSizePage();
      });
  screenTestGolden(
      tag: 'text_size_bigger',
      screenName: 'Text Size',
      skipTapTargetSizeGuideline: true,
      builder: () {
        return const TextSizePage(
          initPoliceSize: 3,
        );
      });
}
