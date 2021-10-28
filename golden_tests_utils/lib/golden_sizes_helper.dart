import 'package:golden_toolkit/golden_toolkit.dart';

class GoldenSizeHelper {
  static final screens = screensWithoutAccessibility + accessibleScreens;

  static final a11yScreen = Device.phone.copyWith(name: 'a11y', textScale: 2);

  static final screensWithoutAccessibility = [
    /// [iphone11] matches specs of iphone11, but with lower DPI for performance
    Device.iphone11,
  ];

  static final landscapeScreens = [
    Device.tabletLandscape,
  ];

  static final accessibleScreens = [
    a11yScreen,
  ];

  static final semanticsScreen = Device.phone.copyWith(name: 'semantic');
}
