part of '../../../modules.dart';

/// Mixin สำหรับเมดธอดและตัวแปรสำหรับหน้าฟอร์มสร้าง PO
mixin CreatingPoFormMixin {
  final _type = ValueNotifier(CreatingPoFormType.values.first);
  final _confirmButtonEnabled = ValueNotifier(false);
  final _taxPriceIncluded = ValueNotifier(false);
  final _vehiclePictureRequired = ValueNotifier(false);
  final _weighingSlipRequired = ValueNotifier(false);
  final _onlyFollowingCustomersAccepted = ValueNotifier(false);
  final _agreementAccepted = ValueNotifier(false);
  late final _totalAcceptedAmount = TextEditingController()..addListener(_onTotalAcceptedAmountChanged);
  late final _minimumAmountPerRound = TextEditingController()..addListener(_onTextEditingControllerChanged);
  late final _pricePerUnit = TextEditingController()..addListener(_onTextEditingControllerChanged);
  late final _details = TextEditingController()..addListener(_onTextEditingControllerChanged);
  final _startDate = ValueNotifier<DateTime?>(null);
  final _endDate = ValueNotifier<DateTime?>(null);
  final _numberInputFormatter = NumberTextInputFormatter(groupDigits: 3);
  final _materials = ValueNotifier<Iterable<CpoMaterialItem>?>(null);
  final _selectedMaterial = ValueNotifier<CpoMaterialItem?>(null);

  /// เหรียญคงเหลือ
  int get remainingCoins;

  /// ปริมาณรับซื้อโดยรวมทั้งหมดสูงสุดที่ระบบอนุญาตให้ป้อน
  double get maximumTotalAcceptedAmount;

  /// ราคารับรองต่อหน่วยสูงสุด
  double get maximumPricePerUnit;

  /// หน่วยของวัสดุรับซื้อ
  String get unit;

  /// ประเภทการรับซื้อ
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
  bool get agreementAccepted => _agreementAccepted.value;

  /// วันเริ่มต้น
  DateTime? get startDate => _startDate.value;

  /// วันสิ้นสุด
  DateTime? get endDate => _endDate.value;

  /// ปริมาณรวม
  double? get totalAcceptedAmount => double.tryParse(_totalAcceptedAmount.text.replaceAll(',', ''));

  /// จำนวนรับขั้นต่ำต่อครั้ง
  double? get minimumAmountPerRound => double.tryParse(_minimumAmountPerRound.text.replaceAll(',', ''));

  /// ราคาประกันขั้นต่ำ
  double? get pricePerUnit => double.tryParse(_pricePerUnit.text.replaceAll(',', ''));

  /// เหรียญที่ใช้
  int get usedCoins;

  /// รายละเอียด
  String get details => _details.text;

  /// รายการวัสดุที่เลือกไว้
  CpoMaterialItem? get selectedMaterial => _selectedMaterial.value;

  /// รายการวัสดุที่สามารถเลือกได้
  Iterable<CpoMaterialItem>? get materialList => _materials.value;

  /// [TextEditingController] ของปริมาณรวม
  TextEditingController get totalAcceptedAmountController => _totalAcceptedAmount;

  /// [TextEditingController] ของจำนวณรับขั้นต่ำต่อครั้ง
  TextEditingController get minimumAmountPerRoundController => _minimumAmountPerRound;

  /// [TextEditingController] ของราคาประกันขั้นต่ำ
  TextEditingController get pricePerUnitController => _pricePerUnit;

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
    return ReactiveTextInputFormatter((oldValue, newValue) {
      final max = totalAcceptedAmount;
      final minimumAmountPerRoundValue = double.tryParse(newValue.text);

      return _numberInputFormatter.formatEditUpdate(
        oldValue,
        newValue.copyWith(
          text: max != null && max.isFinite && max >= 0 && minimumAmountPerRoundValue != null && minimumAmountPerRoundValue.isFinite
              ? '${minimumAmountPerRoundValue.clamp(0, max)}'
              : newValue.text,
        ),
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
    // _usedCoins.dispose();
    _details.dispose();
  }

  /// เปลี่ยนประเภทการรับส่ง
  void setType(CreatingPoFormType type) {
    _type.value = type;
  }

  /// สลับสถานะการยอมรับการใช้บริการ
  void toggleAgreementAccepted() {
    _agreementAccepted.value = !_agreementAccepted.value;
    refreshConfirmButton();
  }

  /// สลับสถานะการอนุญาตให้แสดงรายการแค่ผู้ที่ติดตามเท่านั้น
  void toggleOnlyFollowingCustomersAccepted() {
    _onlyFollowingCustomersAccepted.value = !_onlyFollowingCustomersAccepted.value;
    refreshConfirmButton();
  }

  /// สลับสถานะความต้องการใบชั่งน้ำหนักเป็นหลักฐานการรับซื้อ
  void toggleWeighingSlipRequired() {
    _weighingSlipRequired.value = !_weighingSlipRequired.value;
    refreshConfirmButton();
  }

  /// สลับสถานะความต้องการรูปภาพพาหนะพร้อมวัสดุเป็นหลักฐานการรับซื้อ
  void toggleVehiclePictureRequired() {
    _vehiclePictureRequired.value = !_vehiclePictureRequired.value;
    refreshConfirmButton();
  }

  /// สลับสถานะราคารับซื้อที่มีการคำนวนภาษีมูลค่าแล้ว
  void toggleTaxPriceIncluded() {
    _taxPriceIncluded.value = !_taxPriceIncluded.value;
    refreshConfirmButton();
  }

  /// ปรับวันที่เริ่มต้นรายการ
  void setStartDate(DateTime date) {
    _startDate.value = date;
    refreshConfirmButton();
  }

  /// ปรับวันที่สิ้นสุดรายการ
  void setEndDate(DateTime date) {
    _endDate.value = date;
    refreshConfirmButton();
  }

  void _onTotalAcceptedAmountChanged() {
    final totalAmount = totalAcceptedAmount;
    final minimumAmount = minimumAmountPerRound;

    if (totalAmount == null || (minimumAmount != null && minimumAmount > totalAmount)) {
      _minimumAmountPerRound.value = _totalAcceptedAmount.value.copyWith();
    }

    refreshConfirmButton();
  }

  void _onTextEditingControllerChanged() {
    refreshConfirmButton();
  }

  /// แทนที่รายการวัสดุถที่สามารถเลือกได้
  void replaceMaterialList(Iterable<CpoMaterialItem> list) => _materials.value = list;

  /// เลือกวัสดุที่ต้องการรับ
  void selectMaterialItem(CpoMaterialItem item) {
    _selectedMaterial.value = item;
    refreshConfirmButton();
  }

  /// เมธอดสำหรับตรวจสอบข้อมูลยืนยันรายการและปรับสถานะปุ่มยืนยัน
  bool applyConfirmButtonStatus(
    DateTime? startDate,
    DateTime? endDate,
    double? totalAcceptedAmount,
    double? minimumAmountPerRound,
    double? pricePerUnit,
    int usedCoins,
    bool agreementAccepted,
  ) =>
      totalAcceptedAmount != null &&
      totalAcceptedAmount > 0 &&
      minimumAmountPerRound != null &&
      minimumAmountPerRound > 0 &&
      pricePerUnit != null &&
      pricePerUnit > 0 &&
      usedCoins >= 0 &&
      usedCoins <= remainingCoins &&
      startDate != null &&
      endDate != null &&
      endDate.isAfter(startDate) &&
      agreementAccepted;

  /// บังคับให้ปุ่มยืนยันไม่สามารถใช้งานได้
  void disableConfirmButton() => _confirmButtonEnabled.value = false;

  /// บังคับให้ปุ่มยืนยันสามารถใช้งานได้
  void enableConfirmButton() => _confirmButtonEnabled.value = true;

  /// บังคับให้ปุ่มยืนยันให้ตรงตามสถานะ [applyConfirmButtonStatus]
  void refreshConfirmButton() => _confirmButtonEnabled.value = applyConfirmButtonStatus(
        _startDate.value,
        _endDate.value,
        totalAcceptedAmount,
        minimumAmountPerRound,
        pricePerUnit,
        usedCoins,
        _agreementAccepted.value,
      );

  /// ยืนยันรายการ PO
  Future submit({
    void Function(dynamic result)? onSuccessful,
    void Function()? onFailed,
  });
}
