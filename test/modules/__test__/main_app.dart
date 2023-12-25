import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'controllers/app_controller.dart';
import 'views/app_view.dart';

class MainApp<M extends AppController> extends StatelessWidget {
  final M? mockController;
  const MainApp({super.key, required this.mockController});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const AppView(), binding: BindingsBuilder<AppController>.put(() => mockController ?? AppController()))
      ],
    );
  }
}
