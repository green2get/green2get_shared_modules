part of '../../../modules.dart';

/// วิดเจ็ตที่อัพเดทตามวัสดุที่เลือก PO [CreatingPoFormMixin.selectedMaterial]
class CpoMaterialSelectionListener extends StatefulWidget {
  final Widget Function(BuildContext context, CpoMaterialItem? mode) builder;

  const CpoMaterialSelectionListener(this.builder, {super.key});

  @override
  State<StatefulWidget> createState() => _CpoMaterialSelectionListenerState();
}

class _CpoMaterialSelectionListenerState extends State<CpoMaterialSelectionListener> {
  ValueNotifier<CpoMaterialItem?>? _listenable;

  @override
  void didChangeDependencies() {
    final controller = context.dependOnInheritedWidgetOfExactType<_InheritedCreatingPoForm>()?.controller;
    _listenable = controller is CreatingPoFormMixin ? controller._selectedMaterial : null;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final o = _listenable;
    if (o == null) throw StateError('A [CreatingPoForm] ancestor is not found in widget tree.');

    return ListenableBuilder(listenable: o, builder: (context, child) => widget.builder(context, o.value));
  }
}
