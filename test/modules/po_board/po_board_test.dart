import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:green2get_shared_modules/modules/modules.dart';

import 'controllers/po_board_controller.dart';
import 'views/po_board_view.dart';

void main() {
  late GetMaterialApp app;

  setUp(() {
    app = GetMaterialApp(
      home: const PoBoardView(),
      initialBinding: BindingsBuilder<PoBoardController>.put(() => PoBoardController()),
    );
  });

  testWidgets('Checking [PobCountdownTimerListener] widget.', (widgetTester) async {
    await widgetTester.runAsync(() async {
      await widgetTester.pumpWidget(app);
      await widgetTester.pump();

      expect(
        find.descendant(of: find.byType(PobCountdownTimerListener), matching: find.text('9')),
        findsOneWidget,
      );

      await Future.delayed(const Duration(seconds: 3));

      await widgetTester.pump();

      expect(
        find.descendant(of: find.byType(PobCountdownTimerListener), matching: find.text('6')),
        findsOneWidget,
      );
    });
  });

  testWidgets('Checking [PobAmountCounterListener]', (widgetTester) async {
    await widgetTester.runAsync(() async {
      await widgetTester.pumpWidget(app);
      await widgetTester.pump();

      expect(
        find.descendant(of: find.byType(PobAmountCounterListener), matching: find.text('3000.00')),
        findsOneWidget,
      );
    });
  });

  testWidgets('Checking [PobItemAttachedButtonListener]', (widgetTester) async {
    await widgetTester.runAsync(() async {
      await widgetTester.pumpWidget(app);
      await widgetTester.pump();

      expect(
        find.descendant(
            of: find.byType(PobItemAttachedButtonListener), matching: find.byWidgetPredicate((widget) => widget is ElevatedButton && widget.enabled)),
        findsOneWidget,
      );
    });
  });
}
