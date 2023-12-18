import 'package:get/get.dart';
import 'package:green2get_shared_modules/green2get_shared_modules.dart';

class CreatingPoFormController extends GetxController with CreatingPoFormMixin {
  @override
  void onClose() {
    disposeAllCreatingPoFormResources();
    super.onClose();
  }

  @override
  Future<dynamic> submit({
    void Function(dynamic result)? onSuccessful,
    void Function()? onFailed,
  }) {
    // TODO: implement submit
    throw UnimplementedError();
  }

  @override
  double get maximumPricePerUnit => 100;

  @override
  double get maximumTotalAcceptedAmount => 10000;

  @override
  int get remainingCoins => 10;

  @override
  String get unit => 'KG';
}
