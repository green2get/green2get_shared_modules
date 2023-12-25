part of '../../../modules.dart';

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
    final controller = context.dependOnInheritedWidgetOfExactType<_InheritedCreatingPoForm>()?.controller;
    _listenable = controller is CreatingPoFormMixin ? controller._type : null;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final o = _listenable;
    if (o == null) throw StateError('A [CreatingPoForm] ancestor is not found in widget tree.');

    return ListenableBuilder(listenable: o, builder: (context, child) => widget.builder(context, o.value));
  }
}
