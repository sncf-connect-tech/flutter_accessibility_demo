import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_tests_utils/widget_golden.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta/meta.dart';

import 'golden_sizes_helper.dart';

typedef WidgetProvider = Widget Function();
typedef WidgetTesterHook = Future<void> Function(WidgetTester tester);
typedef WidgetTesterHookSync = void Function(WidgetTester tester);

@isTestGroup
void screenTestGolden({
  required String screenName,
  required String tag,
  required WidgetProvider builder,
  WidgetTesterHook? whenWidgetPumped,
  WidgetTesterHookSync? beforeWidgetPump,
  int? pumpMillis,
  bool showSemanticsDebugger = true,
  bool skipLabeledTapTargetGuideline = false,
  bool skipTapTargetSizeGuideline = false,
  bool skipContrastGuideline = true,
  bool withLandscapeScreens = false,
  enableDarkMode = true,
  Finder? finder,
  double? semanticPhoneHeight,
  TargetPlatform? platform,
}) {
  testGoldens('Test Golden $screenName', (WidgetTester tester) async {
    await loadAppFonts();
    await _pumpAndTest(
      tester: tester,
      pumpMillis: pumpMillis,
      widget: MaterialGolden(
        key: Key(tag),
        child: builder.call(),
      ),
      tag: tag,
      whenWidgetPumped: whenWidgetPumped,
      beforeWidgetPump: beforeWidgetPump,
      fullA11yTest: true,
      showSemanticsDebugger: showSemanticsDebugger,
      withLandscapeScreens: withLandscapeScreens,
      skipLabeledTapTargetGuideline: skipLabeledTapTargetGuideline,
      skipContrastGuideline: skipContrastGuideline,
      skipTapTargetSizeGuideline: skipTapTargetSizeGuideline,
      finder: finder,
      semanticPhoneHeight: semanticPhoneHeight,
      platform: platform,
    );
  });
}

Future<void> _pumpAndTest({
  required WidgetTester tester,
  required Widget widget,
  required String tag,
  WidgetTesterHook? whenWidgetPumped,
  WidgetTesterHookSync? beforeWidgetPump,
  required bool fullA11yTest,
  bool showSemanticsDebugger = true,
  bool skipLabeledTapTargetGuideline = false,
  bool skipContrastGuideline = false,
  bool skipTapTargetSizeGuideline = false,
  bool withLandscapeScreens = false,
  Finder? finder,
  double? semanticPhoneHeight,
  int? pumpMillis,
  TargetPlatform? platform,
}) async {
  final SemanticsHandle handle = tester.ensureSemantics();

  beforeWidgetPump?.call(tester);

  await tester.pumpWidgetBuilder(widget,
      wrapper: materialAppWrapper(
        platform: platform ?? TargetPlatform.android,
      ));

  await whenWidgetPumped?.call(tester);

  final CustomPump? customPump =
      pumpMillis != null ? (tester) => tester.pump(Duration(milliseconds: pumpMillis)) : null;

  //Then
  final devices =
      withLandscapeScreens ? GoldenSizeHelper.screens + GoldenSizeHelper.landscapeScreens : GoldenSizeHelper.screens;

  await multiScreenGolden(tester, tag,
      customPump: customPump, devices: devices, autoHeight: true, finder: finder ?? find.byKey(Key(tag)));

  fullA11yTest
      ? await testA11y(tester, skipLabeledTapTargetGuideline, skipContrastGuideline, skipTapTargetSizeGuideline)
      : await checkTextContrast(tester);

  if (showSemanticsDebugger) {
    await tester.pumpWidgetBuilder(
      SemanticsDebugger(
        labelStyle: GoogleFonts.lato(
          textStyle: TextStyle(color: Color(0xFF000000), fontSize: 10.0, height: 0.8),
        ),
        child: widget,
      ),
    );
    await whenWidgetPumped?.call(tester);
    await multiScreenGolden(tester, tag,
        customPump: customPump,
        devices: [
          (semanticPhoneHeight != null)
              ? GoldenSizeHelper.semanticsScreen
                  .copyWith(size: Size(GoldenSizeHelper.semanticsScreen.size.width, semanticPhoneHeight))
              : GoldenSizeHelper.semanticsScreen
        ],
        autoHeight: true,
        finder: find.byKey(Key(tag)));
  }

  handle.dispose();
}

class MaterialGolden extends StatelessWidget {
  final Widget child;
  final List<NavigatorObserver>? navigatorObservers;
  final ThemeMode? themeMode;

  const MaterialGolden({Key? key, required this.child, this.navigatorObservers, this.themeMode = ThemeMode.system})
      : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter accessibility demo',
        home: child,
        navigatorObservers: navigatorObservers ?? [],
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
      );
}
