import 'package:flutter/widgets.dart';

import '../../../../shared/_invocation/tokens.dart';
import '../../controllers/mixins/creating_po_form_mixin.dart';
import '../../models/enums/creating_po_form_type.dart';
import '../../_invocation/symbols.dart';
import '../creating_po_form_view.dart';

/// วิดเจ็ตที่อัพเดทตามสถานะประเภทการสร้าง PO [CreatingPoFormMixin.type]
class CpoFormTypeListener extends StatefulWidget {
  final Widget Function(BuildContext context, CreatingPoFormType mode) builder;

  const CpoFormTypeListener(this.builder, {super.key});

  @override
  State<StatefulWidget> createState() => _FormTypeListenerState();
}

class _FormTypeListenerState extends State<CpoFormTypeListener> {
  ValueNotifier<CreatingPoFormType>? _listenable;

  @override
  void didChangeDependencies() {
    try {
      _listenable = context
          .dependOnInheritedWidgetOfExactType<InheritedCreatingPoForm>()
          ?.controller
          .noSuchMethod(Invocation.method(getModeListenable, [invocationToken]));
    } catch (_) {
      _listenable = null;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final o = _listenable;
    if (o == null) throw StateError('A [CreatingPoForm] ancestor is not found in widget tree.');

    return ListenableBuilder(listenable: o, builder: (context, child) => widget.builder(context, o.value));
  }
}