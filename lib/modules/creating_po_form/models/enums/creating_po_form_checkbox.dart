part of '../../../modules.dart';

/// ใช้สำหรับตรวจสอบ checkbox หน้าสร้าง PO
enum CreatingPoFormCheckbox {
  /// ราคารวมภาษีสินค้ามูลค่าเพิ่ม
  taxPriceIncluded,

  /// ต้องการภาพพาหนะและสินค้า
  vehiclePictureRequired,

  /// ต้องการใบชั่งน้ำหนัก
  weighingSlipRequired,

  /// รับเฉพาะลูกค้าติดตามเท่านั้น
  onlyFollowingCustomersAccepted,

  /// ยอมรับรับเงื่อนไข
  agreementAccepted,
}
