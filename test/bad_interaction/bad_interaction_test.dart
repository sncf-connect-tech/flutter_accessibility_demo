import 'package:flutter_accessibility_demo/cases/bad_interaction.dart';
import 'package:golden_tests_utils/material_golden.dart';

void main() {
  screenTestGolden(
      tag: 'bad_interaction',
      screenName: 'Bad Interaction',
      builder: () {
        return const BadInteractionsPage();
      });
}
