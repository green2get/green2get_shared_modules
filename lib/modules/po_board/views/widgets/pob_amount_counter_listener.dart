part of '../../../modules.dart';

/// วิดเจ็ตที่อัพเดทตาม [PoBoardMixin.getCurrentReceivingAmountOf]
class PobAmountCounterListener extends StatefulWidget {
  final Widget Function(BuildContext context, double value) builder;
  final PoBoardItemData item;

  const PobAmountCounterListener(this.item, this.builder, {super.key});

  @override
  State<StatefulWidget> createState() => _PobAmountCounterListenerState();
}

class _PobAmountCounterListenerState extends State<PobAmountCounterListener> {
  ValueNotifier<double>? _listenable;

  @override
  void didChangeDependencies() {
    final controller = context.dependOnInheritedWidgetOfExactType<_InheritedPoBoard>()?.controller;
    _listenable = controller is PoBoardMixin ? controller._amountCounters[widget.item] : null;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final o = _listenable;
    if (o == null) throw StateError('A [PoBoard] ancestor is not found in widget tree.');

    return ListenableBuilder(listenable: o, builder: (context, child) => widget.builder(context, o.value));
  }
}
