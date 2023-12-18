import 'package:flutter/widgets.dart';

import '../../../../shared/_invocation/tokens.dart';
import '../../controllers/mixins/creating_po_form_mixin.dart';
import '../../_invocation/symbols.dart';
import '../creating_po_form_view.dart';

/// วิดเจ็ตที่อัพเดทตามสถานะปุ่มยืนยัน [CreatingPoFormMixin.confirmButtonEnabled]
class ConfirmButtonListener extends StatefulWidget {
  final Widget Function(BuildContext context, bool value) builder;

  const ConfirmButtonListener(this.builder, {super.key});

  @override
  State<StatefulWidget> createState() => _ConfirmButtonListenerState();
}

class _ConfirmButtonListenerState extends State<ConfirmButtonListener> {
  ValueNotifier<bool>? _listenable;

  @override
  void didChangeDependencies() {
    try {
      _listenable = context
          .dependOnInheritedWidgetOfExactType<InheritedCreatingPoForm>()
          ?.controller
          .noSuchMethod(Invocation.method(getConfirmButtonEnabledListenable, [invocationToken]));
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
