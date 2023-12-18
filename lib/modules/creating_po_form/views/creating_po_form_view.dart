import 'package:flutter/widgets.dart';

import '../../../shared/_invocation/tokens.dart';
import '../_invocation/tokens.dart';

/// คลาสบนสุดของแบบฟอร์มสร้างรายการ PO
class CreatingPoForm<C> extends StatelessWidget {
  final C controller;
  final Widget child;

  const CreatingPoForm({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    try {
      final token = controller.noSuchMethod(Invocation.method(getMixinToken, [invocationToken]));
      if (token != creatingPoFormMixinToken) throw 0;
    } catch (_) {
      throw StateError('The controller must be mixed in with [CreatingPoFormMixin].');
    }

    return InheritedCreatingPoForm(controller: controller, child: child);
  }
}

class InheritedCreatingPoForm extends InheritedWidget {
  final dynamic controller;

  const InheritedCreatingPoForm({super.key, required super.child, required this.controller});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => oldWidget is InheritedCreatingPoForm && oldWidget.controller != controller;
}
