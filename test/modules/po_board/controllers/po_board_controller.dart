import 'package:get/get.dart';
import 'package:green2get_shared_modules/green2get_shared_modules.dart';

import '../models/po_board_model.dart';

class PoBoardController extends GetxController with PoBoardMixin {
  @override
  void onReady() {
    retrievePoBoardList().then((value) {
      replacePoBoardList(value);
      startCountdownTimers();
    });

    super.onReady();
  }

  @override
  void onClose() {
    disposeAllPoBoardResources();
    super.onClose();
  }

  @override
  Future retrievePoBoardList({
    void Function()? onSuccessful,
    void Function()? onFailed,
  }) async {
    return generateMockPoBoardModelList(DateTime.now().add(const Duration(seconds: 10)));
  }
}
