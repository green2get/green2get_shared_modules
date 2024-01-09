part of '../../../modules.dart';

/// วิดเจ็ตที่อัพเดทตาม [PoBoardMixin.poBoardItems]
class PobItemsListener<P extends PoBoardItemData> extends StatefulWidget {
  final Widget Function(BuildContext context, Iterable<P> items) builder;

  const PobItemsListener(this.builder, {super.key});

  @override
  State<StatefulWidget> createState() => _PobItemsListenerState<P>();
}

class _PobItemsListenerState<P extends PoBoardItemData> extends State<PobItemsListener<P>> {
  ValueNotifier<Iterable<PoBoardItemData>>? _listenable;

  @override
  void didChangeDependencies() {
    final controller = context.dependOnInheritedWidgetOfExactType<_InheritedPoBoard>()?.controller;
    _listenable = controller is PoBoardMixin ? controller._items : null;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final o = _listenable;
    if (o == null) throw StateError('A [PoBoard] ancestor is not found in widget tree.');

    return ListenableBuilder(listenable: o, builder: (context, child) => widget.builder(context, o.value.cast<P>()));
  }
}
