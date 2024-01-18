part of '../../../modules.dart';

/// วิดเจ็ตทีอัพเดทตามสถานะ checkbox ภายในหน้าสร้าง PO
///
/// [checkbox] ระบุตาม checkbox ที่ต้องการ
class CpoCheckboxListener extends StatefulWidget {
  final CreatingPoFormCheckbox checkbox;
  final Widget Function(BuildContext context, bool value) builder;

  const CpoCheckboxListener(this.checkbox, this.builder, {super.key});

  @override
  State<StatefulWidget> createState() => _CheckboxListenerState();
}

class _CheckboxListenerState extends State<CpoCheckboxListener> {
  ValueNotifier<bool>? _listenable;

  @override
  void didChangeDependencies() {
    final controller = context.dependOnInheritedWidgetOfExactType<_InheritedCreatingPoForm>()?.controller;

    if (controller is! CreatingPoFormMixin) {
      _listenable = null;
      super.didChangeDependencies();
      return;
    }

    switch (widget.checkbox) {
      case CreatingPoFormCheckbox.agreementAccepted:
        _listenable = controller._agreementAccepted;
        break;
      case CreatingPoFormCheckbox.onlyFollowingCustomersAccepted:
        _listenable = controller._onlyFollowingCustomersAccepted;
        break;
      case CreatingPoFormCheckbox.taxPriceIncluded:
        _listenable = controller._taxPriceIncluded;
        break;
      case CreatingPoFormCheckbox.vehiclePictureRequired:
        _listenable = controller._vehiclePictureRequired;
        break;
      case CreatingPoFormCheckbox.weighingSlipRequired:
        _listenable = controller._weighingSlipRequired;
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
