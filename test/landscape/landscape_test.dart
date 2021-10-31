import 'package:flutter_accessibility_demo/cases/landscape.dart';
import 'package:golden_tests_utils/material_golden.dart';

void main() {
  screenTestGolden(
      tag: 'landscape',
      screenName: 'Landscape',
      withLandscapeScreens: true,
      skipTapTargetSizeGuideline: true,
      builder: () {
        return const LandscapePage();
      });
}
