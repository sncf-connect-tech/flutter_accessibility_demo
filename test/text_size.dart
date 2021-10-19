import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/cases/text_size.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Golden: cas nominal', (WidgetTester tester) async {
    const key = 'text_size';
    var widget = TextSizePage();

    await tester.pumpWidgetBuilder(widget, surfaceSize: const Size(200, 52));

    await multiScreenGolden(tester, key,
        devices: [const Device(size: Size(200, 52), name: 'custom')], finder: find.byKey(const Key(key)));
  });
}
