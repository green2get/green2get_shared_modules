import 'package:flutter/widgets.dart';

import '../../../../shared/_invocation/tokens.dart';
import '../../models/enums/creating_po_form_checkbox.dart';
import '../../_invocation/symbols.dart';
import '../creating_po_form_view.dart';

/// วิดเจ็ตทีอัพเดทตามสถานะ checkbox ภายในหน้าสร้าง PO
///
/// [checkbox] ระบุตาม checkbox ที่ต้องการ
class CheckboxListener extends StatefulWidget {
  final CreatingPoFormCheckbox checkbox;
  final Widget Function(BuildContext context, bool value) builder;

  const CheckboxListener(this.checkbox, this.builder, {super.key});

  @override
  State<StatefulWidget> createState() => _CheckboxListenerState();
}

class _CheckboxListenerState extends State<CheckboxListener> {
  ValueNotifier<bool>? _listenable;

  @override
  void didChangeDependencies() {
    try {
      _listenable = context
          .dependOnInheritedWidgetOfExactType<InheritedCreatingPoForm>()
          ?.controller
          .noSuchMethod(Invocation.method(getConfirmButtonEnabledListenable, [invocationToken, widget.checkbox]));
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
