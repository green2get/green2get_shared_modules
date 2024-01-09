part of '../../modules.dart';

/// คลาสบนสุดของรายการรับส่ง PO
class PoBoard<C> extends StatelessWidget {
  final C controller;
  final Widget child;

  const PoBoard({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    if (controller is! PoBoardMixin) throw StateError('The controller must be mixed in with [PoBoardMixin].');

    return _InheritedPoBoard(controller: controller, child: child);
  }
}

class _InheritedPoBoard extends InheritedWidget {
  final dynamic controller;

  const _InheritedPoBoard({required super.child, required this.controller});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => oldWidget is _InheritedPoBoard && oldWidget.controller != controller;
}
