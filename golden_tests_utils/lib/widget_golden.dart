import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:meta/meta.dart';

class GoldenGridBuilder {
  late GoldenBuilder _builder;

  final Map<String, Widget> _scenarii = {};
  Color? _bgColor;
  int columns;
  double widthToHeightRatio;
  WidgetWrapper? wrap;

  GoldenGridBuilder({
    this.columns = 2,
    this.widthToHeightRatio = 2,
    this.wrap,
  });

  GoldenGridBuilder setBgColor(Color bgColor) {
    _bgColor = bgColor;

    return this;
  }

  GoldenGridBuilder _createBuilder() {
    _builder = columns == 1
        ? GoldenBuilder.column(wrap: wrap, bgColor: _bgColor)
        : GoldenBuilder.grid(columns: columns, widthToHeightRatio: widthToHeightRatio, wrap: wrap, bgColor: _bgColor);

    return this;
  }

  GoldenGridBuilder setScenarii(bool withTextScaleScenario) {
    _scenarii.forEach((name, widget) {
      _builder.addScenario(name, widget);
      if (withTextScaleScenario) {
        _builder.addTextScaleScenario('$name a11y', widget, textScaleFactor: 2.0);
      }
    });

    return this;
  }

  void addScenario(String name, Widget widget) => _scenarii[name] = widget;

  Widget build({bool withTextScaleScenario = true}) =>
      _createBuilder().setScenarii(withTextScaleScenario)._builder.build();
}

const defaultSurfaceSize = SurfaceSpec(surface: Size(600, 300));

String addDeviceName(List<Device>? devices) {
  return devices != null && devices.isNotEmpty && devices.first.name.isNotEmpty ? '_' + devices.first.name : '';
}

class SurfaceSpec {
  final String name;
  final Size surface;
  final double widthToHeightRatio;

  const SurfaceSpec({this.name = '', required this.surface, this.widthToHeightRatio = 2});
}

typedef WidgetTesterHook = Future<void> Function(WidgetTester tester);

@isTestGroup
void dsWidgetTestGolden({
  required String widgetName,
  required String widgetTag,
  Size? surfaceSize,
  List<SurfaceSpec>? surfacesSize,
  double? widthToHeightRatio,
  int? columns,
  bool skipLabeledTapTargetGuideline = false,
  bool skipTapTargetSizeGuideline = false,
  bool skipContrastGuideline = true,
  TargetPlatform? platform,
  WidgetTesterHook? whenWidgetPumped,
  bool semanticsOnly = false,
  Color? backgroundColor,
  required Map<String, Widget> scenarii,
}) {
  testGoldens('Test Golden $widgetName', (WidgetTester tester) async {
    List<SurfaceSpec> _surfaces = [];
    if (surfacesSize != null) {
      _surfaces.addAll(surfacesSize);
    } else {
      _surfaces.add(surfaceSize != null ? SurfaceSpec(surface: surfaceSize) : defaultSurfaceSize);
    }

    final SemanticsHandle handle = tester.ensureSemantics();

    await Future.forEach(_surfaces, (SurfaceSpec spec) async {
      final String suffix =
          '${platform != null ? '_${platform.toString().split('.').last}' : ''}${spec.name.isNotEmpty ? '_${spec.name}' : ''}';
      final builder = GoldenGridBuilder(columns: columns ?? 2, widthToHeightRatio: spec.widthToHeightRatio);

      scenarii.forEach((key, value) {
        builder.addScenario(key, value);
      });

      builder.setBgColor(backgroundColor ?? Colors.black);

      final widget = builder.build(withTextScaleScenario: !semanticsOnly);

      await tester.pumpWidgetBuilder(
          semanticsOnly
              ? SemanticsDebugger(
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 10.0,
                    height: 0.8,
                  ),
                  child: widget,
                )
              : widget,
          surfaceSize: spec.surface,
          wrapper: materialAppWrapper(
            platform: platform ?? TargetPlatform.android,
          ));

      await whenWidgetPumped?.call(tester);

      final tag = suffix.isEmpty ? widgetTag : '$widgetTag$suffix';
      await screenMatchesGolden(tester, tag);

      if (!semanticsOnly) {
        await testA11y(tester, skipLabeledTapTargetGuideline, skipContrastGuideline, skipTapTargetSizeGuideline);
      }
    });

    handle.dispose();
  });
}

Future testA11y(WidgetTester tester, bool skipLabeledTapTargetGuideline, bool skipContrastGuideline,
    bool skipTapTargetSizeGuideline) async {
  if (!skipLabeledTapTargetGuideline) {
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
  }

  if (!skipContrastGuideline) {
    await checkTextContrast(tester);
  }

  if (!skipTapTargetSizeGuideline) {
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
  }
}

Future checkTextContrast(WidgetTester tester) async {
  await expectLater(tester, meetsGuideline(textContrastGuideline));
}

class MaterialGolden extends StatelessWidget {
  final Widget child;
  final TargetPlatform? platform;

  const MaterialGolden({Key? key, required this.child, this.platform}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Design System',
        debugShowCheckedModeBanner: false,
        home: child,
      );
}
