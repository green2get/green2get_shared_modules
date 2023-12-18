import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';

import 'package:green2get_shared_modules/green2get_shared_modules.dart';

import '../../../../shared/_invocation/tokens.dart';

import '../../../../shared/widgets/input_formatters/reactive_text_input_formatter.dart';
import '../../_invocation/symbols.dart';
import '../../_invocation/tokens.dart';

/// Mixin สำหรับเมดธอดและตัวแปรสำหรับหน้าฟอร์มสร้าง PO
mixin CreatingPoFormMixin {
  DateTime? _startDate;
  DateTime? _endDate;

  final _type = ValueNotifier(CreatingPoFormType.values.first);
  final _confirmButtonEnabled = ValueNotifier(false);
  final _taxPriceIncluded = ValueNotifier(false);
  final _vehiclePictureRequired = ValueNotifier(false);
  final _weighingSlipRequired = ValueNotifier(false);
  final _onlyFollowingCustomersAccepted = ValueNotifier(false);
  final _agreementAccepted = ValueNotifier(false);
  final _totalAcceptedAmount = TextEditingController();
  final _minimumAmountPerRound = TextEditingController();
  final _pricePerUnit = TextEditingController();
  final _usedCoins = TextEditingController();
  final _details = TextEditingController();

  /// เหรียญคงเหลือ
  @mustBeOverridden
  int get remainingCoins;

  /// ปริมาณรับซื้อโดยรวมทั้งหมดสูงสุด
  @mustBeOverridden
  double get maximumTotalAcceptedAmount;

  /// ราคารับรองต่อหน่วยสูงสุด
  @mustBeOverridden
  double get maximumPricePerUnit;

  /// หน่วยของวัสดุรับซื้อ
  @mustBeOverridden
  String get unit;

  /// ประเภทการับซื้อ
  CreatingPoFormType get type => _type.value;

  /// ปุ่มยืนยันรายการ
  bool get confirmButtonEnabled => _confirmButtonEnabled.value;

  /// ราคารวมภาษีมูลค่าเพิ่ม
  bool get taxPriceIncluded => _taxPriceIncluded.value;

  /// ต้องการรูปพาหนะพร้อมสินค้า
  bool get vehiclePictureRequired => _vehiclePictureRequired.value;

  /// ต้องการใบตรวจสอบน้ำหนัก
  bool get weighingSlipRequired => _weighingSlipRequired.value;

  /// รับเฉพาะลูกค้าติดตาม
  bool get onlyFollowingCustomersAccepted => _onlyFollowingCustomersAccepted.value;

  /// ยอมรับข้อตกลงการใช้บริการ
  bool get aggreementAccepted => _agreementAccepted.value;

  /// วันเริ่มต้น
  DateTime? get startDate => _startDate;

  /// วันสิ้นสุด
  DateTime? get endDate => _endDate;

  /// ปริมาณรวม
  double? get totalAcceptedAmount => double.tryParse(_totalAcceptedAmount.text.replaceAll(',', ''));

  /// จำนวนรับขั้นต่ำต่อครั้ง
  double? get minimumAmountPerRound => double.tryParse(_minimumAmountPerRound.text.replaceAll(',', ''));

  /// ราคาประกันขั้นต่ำ
  double? get pricePerUnit => double.tryParse(_pricePerUnit.text.replaceAll(',', ''));

  /// เหรียญที่ใช้
  int? get usedCoins => int.tryParse(_usedCoins.text.replaceAll(',', ''));

  /// รายละเอียด
  String get details => _details.text;

  /// [TextEditingController] ของปริมาณรวม
  TextEditingController get totalAcceptedAmountController => _totalAcceptedAmount;

  /// [TextEditingController] ของจำนวณรับขั้นต่ำต่อครั้ง
  TextEditingController get minimumAmountPerRoundController => _minimumAmountPerRound;

  /// [TextEditingController] ของราคาประกันขั้นต่ำ
  TextEditingController get pricePerUnitController => _pricePerUnit;

  /// [TextEditingController] ของเหรียญที่ใช้
  TextEditingController get usedCoinsController => _usedCoins;

  /// [TextEditingController] ของรายละเอียด
  TextEditingController get detailsController => _details;

  /// [TextInputFormatter] ของเหรียญที่ใช้
  TextInputFormatter get usedCoinsFormatter {
    final max = remainingCoins;
    return NumberTextInputFormatter(maxValue: max.isFinite && max >= 0 ? '$max' : null, groupDigits: 3);
  }

  /// [TextInputFormatter] ของปริมาณรับโดยรวม
  TextInputFormatter get totalAcceptedAmountFormatter {
    final max = maximumTotalAcceptedAmount;
    return NumberTextInputFormatter(maxValue: max.isFinite && max >= 0 ? '$max' : null, groupDigits: 3);
  }

  /// [TextInputFormatter] ของปริมาณรับขั้นต่ำต่อครั้ง
  TextInputFormatter get minimumAmountPerRoundFormatter {
    return ReactiveTextInputFormatter(() {
      final max = totalAcceptedAmount;
      return NumberTextInputFormatter(
        maxValue: max != null && max.isFinite && max >= 0 ? '$max' : null,
        groupDigits: 3,
      );
    });
  }

  /// [TextInputFormatter] ของราคาประกันต่อหน่วย
  TextInputFormatter get pricePerUnitFormatter {
    final max = maximumPricePerUnit;
    return NumberTextInputFormatter(maxValue: max.isFinite && max >= 0 ? '$max' : null, groupDigits: 3);
  }

  /// ถอนทรัพยากรหน้าสร้าง PO
  void disposeAllCreatingPoFormResources() {
    _type.dispose();
    _confirmButtonEnabled.dispose();
    _taxPriceIncluded.dispose();
    _vehiclePictureRequired.dispose();
    _weighingSlipRequired.dispose();
    _onlyFollowingCustomersAccepted.dispose();
    _agreementAccepted.dispose();
    _totalAcceptedAmount.dispose();
    _minimumAmountPerRound.dispose();
    _pricePerUnit.dispose();
    _usedCoins.dispose();
    _details.dispose();
  }

  void setType(CreatingPoFormType type) {
    _type.value = type;
    _checkConfirmButtonStatus();
  }

  void toggleAgreementAccepted() {
    _agreementAccepted.value = !_agreementAccepted.value;
    _checkConfirmButtonStatus();
  }

  void toggleOnlyFollowingCustomersAccepted() {
    _onlyFollowingCustomersAccepted.value = !_onlyFollowingCustomersAccepted.value;
    _checkConfirmButtonStatus();
  }

  void toggleWeighingSlipRequired() {
    _weighingSlipRequired.value = !_weighingSlipRequired.value;
    _checkConfirmButtonStatus();
  }

  void toggleVehiclePictureRequired() {
    _vehiclePictureRequired.value = !_vehiclePictureRequired.value;
    _checkConfirmButtonStatus();
  }

  void toggleTaxPriceIncluded() {
    _taxPriceIncluded.value = !_taxPriceIncluded.value;
    _checkConfirmButtonStatus();
  }

  void setStartDate(DateTime date) {
    _startDate = date;
    _checkConfirmButtonStatus();
  }

  void setEndDate(DateTime date) {
    _endDate = date;
    _checkConfirmButtonStatus();
  }

  void _checkConfirmButtonStatus() {
    final startDate = _startDate,
        endDate = _endDate,
        totalAcceptedAmount = this.totalAcceptedAmount,
        minimumAmountPerRound = this.minimumAmountPerRound,
        pricePerUnit = this.pricePerUnit,
        usedCoins = this.usedCoins;

    _confirmButtonEnabled.value = totalAcceptedAmount != null &&
        totalAcceptedAmount > 0 &&
        minimumAmountPerRound != null &&
        minimumAmountPerRound > 0 &&
        pricePerUnit != null &&
        pricePerUnit > 0 &&
        usedCoins != null &&
        usedCoins >= 0 &&
        startDate != null &&
        endDate != null &&
        endDate.isAfter(startDate) &&
        _agreementAccepted.value;
  }

  /// ยืนยันรายการ PO
  @mustBeOverridden
  Future submit({
    void Function(dynamic result)? onSuccessful,
    void Function()? onFailed,
  });

  @override
  noSuchMethod(Invocation invocation) {
    if (!invocation.isMethod || invocation.positionalArguments.isEmpty || invocation.positionalArguments.first != invocationToken) {
      return super.noSuchMethod(invocation);
    }

    switch (invocation.memberName) {
      case getModeListenable:
        return _type;
      case getConfirmButtonEnabledListenable:
        return _confirmButtonEnabled;
      case getCheckboxListeneable:
        if (invocation.positionalArguments.length < 2) return super.noSuchMethod(invocation);
        switch (invocation.positionalArguments.elementAt(1)) {
          case CreatingPoFormCheckbox.agreementAccepted:
            return _agreementAccepted;
          case CreatingPoFormCheckbox.onlyFollowingCustomersAccepted:
            return _onlyFollowingCustomersAccepted;
          case CreatingPoFormCheckbox.taxPriceIncluded:
            return _taxPriceIncluded;
          case CreatingPoFormCheckbox.vehiclePictureRequired:
            return _vehiclePictureRequired;
          case CreatingPoFormCheckbox.weighingSlipRequired:
            return _weighingSlipRequired;
          default:
            return super.noSuchMethod(invocation);
        }
      case getMixinToken:
        return creatingPoFormMixinToken;
      default:
        return super.noSuchMethod(invocation);
    }
  }
}
