import 'package:flutter_accessibility_demo/cases/no_state.dart';
import 'package:golden_tests_utils/material_golden.dart';

void main() {
  screenTestGolden(
      tag: 'no_state',
      screenName: 'No State',
      builder: () {
        return const NoStatePage(
          initiallyExpanded: true,
        );
      });
}
