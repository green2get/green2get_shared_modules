part of '../../../modules.dart';

/// วิดเจ็ตที่อัพเดทตามสถานะปุ่มยืนยัน [CreatingPoFormMixin.confirmButtonEnabled]
class CpoConfirmButtonListener extends StatefulWidget {
  final Widget Function(BuildContext context, bool enabled) builder;

  const CpoConfirmButtonListener(this.builder, {super.key});

  @override
  State<StatefulWidget> createState() => _ConfirmButtonListenerState();
}

class _ConfirmButtonListenerState extends State<CpoConfirmButtonListener> {
  ValueNotifier<bool>? _listenable;

  @override
  void didChangeDependencies() {
    final controller = context.dependOnInheritedWidgetOfExactType<_InheritedCreatingPoForm>()?.controller;
    _listenable = controller is CreatingPoFormMixin ? controller._confirmButtonEnabled : null;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final o = _listenable;
    if (o == null) throw StateError('A [CreatingPoForm] ancestor is not found in widget tree.');

    return ListenableBuilder(listenable: o, builder: (context, child) => widget.builder(context, o.value));
  }
}
