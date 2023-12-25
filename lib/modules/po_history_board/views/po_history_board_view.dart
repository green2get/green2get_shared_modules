part of '../../modules.dart';

/// คลาสบนสุดของแบบฟอร์มสร้างรายการ PO
class PoHistoryBoard<C> extends StatelessWidget {
  final C controller;
  final Widget child;

  const PoHistoryBoard({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    if (controller is! PoHistoryBoardMixin) throw StateError('The controller must be mixed in with [PoHistoryBoardMixin].');

    return _InheritedPoHistoryBoard(controller: controller, child: child);
  }
}

class _InheritedPoHistoryBoard extends InheritedWidget {
  final dynamic controller;

  const _InheritedPoHistoryBoard({required super.child, required this.controller});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => oldWidget is _InheritedPoHistoryBoard && oldWidget.controller != controller;
}
