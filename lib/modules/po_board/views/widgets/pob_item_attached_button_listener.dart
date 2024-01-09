part of '../../../modules.dart';

/// วิดเจ็ตที่อัพเดทตาม [PoBoardMixin.getItemAttachedButtonEnabledOf]
class PobItemAttachedButtonListener extends StatefulWidget {
  final Widget Function(BuildContext context, bool enabled) builder;
  final PoBoardItemData item;

  const PobItemAttachedButtonListener(this.item, this.builder, {super.key});

  @override
  State<StatefulWidget> createState() => _PobItemAttachedButtonListenerState();
}

class _PobItemAttachedButtonListenerState extends State<PobItemAttachedButtonListener> {
  ValueNotifier<bool>? _listenable;

  @override
  void didChangeDependencies() {
    final controller = context.dependOnInheritedWidgetOfExactType<_InheritedPoBoard>()?.controller;
    _listenable = controller is PoBoardMixin ? controller._itemAttachedButtonsEnabled[widget.item] : null;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final o = _listenable;
    if (o == null) throw StateError('A [PoBoard] ancestor is not found in widget tree.');

    return ListenableBuilder(listenable: o, builder: (context, child) => widget.builder(context, o.value));
  }
}
