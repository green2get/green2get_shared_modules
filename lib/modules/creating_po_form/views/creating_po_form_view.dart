part of '../../modules.dart';

/// คลาสบนสุดของแบบฟอร์มสร้างรายการ PO
class CreatingPoForm<C> extends StatelessWidget {
  final C controller;
  final Widget child;

  const CreatingPoForm({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    if (controller is! CreatingPoFormMixin) throw StateError('The controller must be mixed in with [CreatingPoFormMixin].');

    return _InheritedCreatingPoForm(controller: controller, child: child);
  }
}

class _InheritedCreatingPoForm extends InheritedWidget {
  final dynamic controller;

  const _InheritedCreatingPoForm({required super.child, required this.controller});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => oldWidget is _InheritedCreatingPoForm && oldWidget.controller != controller;
}
