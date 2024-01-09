import 'package:green2get_shared_modules/green2get_shared_modules.dart';

class PoBoardModel extends JsonObject implements PoBoardItemData {
  PoBoardModel(super.source);

  @override
  double get currentReceivingAmount => source['received'];

  @override
  DateTime get expiringDateTime => DateTime.parse(source['endDate']);

  @override
  int get id => source['id'];

  @override
  String get image => source['imageUrl'];

  @override
  double get maximumTotalReceivingAmount => source['maxReceived'];

  @override
  double get pricePerUnit => source['price'];

  @override
  String get recipient => source['createdByName'];

  @override
  double get includedTaxPricePerUnit => source['tax'];

  @override
  String get title => source['name'];

  @override
  String get recipientImage => source['createdByImageUrl'];

  @override
  String get unit => source['unit'];
}

List<PoBoardModel> generateMockPoBoardModelList([DateTime? endDate]) {
  endDate ??= DateTime.now()..add(const Duration(days: 30));

  return [
    PoBoardModel({
      'id': 1,
      'name': 'Test PO',
      'createdByName': 'Random',
      'received': 3000.0,
      'maxReceived': 10000.0,
      'imageUrl': '...',
      'createdByImageUrl': '...',
      'unit': 'KG',
      'price': 1.5,
      'tax': 2.0,
      'endDate': endDate.toIso8601String(),
    }),
  ];
}
