import 'package:flutter/material.dart';

/// GlobalKey for app's navigator and the global context.
final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey();

final BuildContext? globalContext = appNavigatorKey.currentContext;

extension ContextSize on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;
}
