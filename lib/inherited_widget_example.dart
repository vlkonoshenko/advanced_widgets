import 'package:flutter/widgets.dart';

class InheritedWidgetExample extends InheritedWidget {
  final bool isDark;

  const InheritedWidgetExample({
    super.key,
    required this.isDark,
    required super.child,
  });

  static InheritedWidgetExample of(BuildContext context) {
    final InheritedWidgetExample? result =
        context.dependOnInheritedWidgetOfExactType<InheritedWidgetExample>();
    assert(result != null, 'No InheritedWidgetExample found in context');
    return result!;
  }

  

  @override
  bool updateShouldNotify(InheritedWidgetExample oldWidget) =>
      isDark != oldWidget.isDark;
}
