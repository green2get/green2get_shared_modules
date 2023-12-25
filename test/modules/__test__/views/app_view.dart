import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:green2get_shared_modules/modules/__test__/test_02/views/widgets/future_image_builder.dart';

import '../controllers/app_controller.dart';

class AppView extends GetView<AppController> {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureImage(
      future: controller.getPicsumImageBytes(width: 640, height: 360).then((value) => MemoryImage(value ?? Uint8List(0))),
    );
  }
}
