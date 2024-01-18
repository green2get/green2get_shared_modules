part of '../../../modules.dart';

/// วิดเจ็ตทีอัพเดทตามสถานะ checkbox ภายในหน้าสร้าง PO
///
/// [checkbox] ระบุตาม checkbox ที่ต้องการ
class CpoDateTimeListener extends StatefulWidget {
  final CreatingPoFormDateTime listenTo;
  final Widget Function(BuildContext context, DateTime? value) builder;

  const CpoDateTimeListener(this.listenTo, this.builder, {super.key});

  @override
  State<StatefulWidget> createState() => _DateTimeListenerState();
}

class _DateTimeListenerState extends State<CpoDateTimeListener> {
  ValueNotifier<DateTime?>? _listenable;

  @override
  void didChangeDependencies() {
    final controller = context.dependOnInheritedWidgetOfExactType<_InheritedCreatingPoForm>()?.controller;

    if (controller is! CreatingPoFormMixin) {
      _listenable = null;
      super.didChangeDependencies();
      return;
    }

    switch (widget.listenTo) {
      case CreatingPoFormDateTime.startDate:
        _listenable = controller._startDate;
        break;
      case CreatingPoFormDateTime.endDate:
        _listenable = controller._endDate;
        break;
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
