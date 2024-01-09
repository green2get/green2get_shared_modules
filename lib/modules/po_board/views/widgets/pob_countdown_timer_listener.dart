part of '../../../modules.dart';

/// วิดเจ็ตที่อัพเดทตาม [PoBoardMixin.getCoundownTimerOf]
class PobCountdownTimerListener extends StatefulWidget {
  final Widget Function(BuildContext context, Duration remainingDuration) builder;
  final PoBoardItemData item;

  const PobCountdownTimerListener(this.item, this.builder, {super.key});

  @override
  State<StatefulWidget> createState() => _PobCountdownTimerListenerState();
}

class _PobCountdownTimerListenerState extends State<PobCountdownTimerListener> {
  ValueNotifier<Duration>? _listenable;

  @override
  void didChangeDependencies() {
    final controller = context.dependOnInheritedWidgetOfExactType<_InheritedPoBoard>()?.controller;
    _listenable = controller is PoBoardMixin ? controller._countdownTimers[widget.item] : null;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final o = _listenable;
    if (o == null) throw StateError('A [PoBoard] ancestor is not found in widget tree.');

    return ListenableBuilder(listenable: o, builder: (context, child) => widget.builder(context, o.value));
  }
}
