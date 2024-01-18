part of '../../modules.dart';

/// วัสดุที่รับซื้อ PO
class CpoMaterialItem extends JsonObject {
  CpoMaterialItem(super.source);

  int get id => source['id'];
  String get name => source['name'];
  String? get commonName => source['commonName'];
  String get unit => source['unit'];
}

/// ลิสต์ของ [CpoMaterialItem]
class CpoMaterialItemList extends JsonList<CpoMaterialItem> {
  CpoMaterialItemList(super.source);

  @override
  CpoMaterialItem deserialize(int index, value) => CpoMaterialItem(value);
}
