part of '../../modules.dart';

/// โมเดลสำหรับแสดงรายการรับส่ง PO
///
/// เมดธอดจาก [PoBoardMixin] และวิดเจ็ต [PobAmountCounterListener], [PobCountdownTimerListener]
/// , [PobItemAttachedButtonListener], [PobItemsListener], [PobItem] ใช้อ็อปเจคนี้เป็นส่วนกลาง
abstract class PoBoardItemData {
  /// ไอดีรายการ PO
  int get id;

  /// รูปภาพรายการ
  String get image;

  /// ชื่อรายการ
  String get title;

  /// ผู้รับปลายทาง
  String get recipient;

  /// รูปภาพผู้รับปลายทาง
  String get recipientImage;

  /// ราคารับส่งต่อหน่วย
  double get pricePerUnit;

  /// ภาษีราคารับส่งต่อหน่วย
  double get includedTaxPricePerUnit;

  /// ปริมาณรับส่งสูงสุดต่อรายการ
  double get maximumTotalReceivingAmount;

  /// ปริมาณรับส่ง ณ ปัจจุบัน
  double get currentReceivingAmount;

  /// วันสิ้นสุดรายการรับส่ง
  DateTime get expiringDateTime;

  /// หน่วยของวัสดุรับส่ง
  String get unit;

  @override
  bool operator ==(Object other) => other is PoBoardItemData && other.id == id;

  @override
  int get hashCode => Object.hash(id, null);
}
