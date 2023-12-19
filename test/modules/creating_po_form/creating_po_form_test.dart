import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:green2get_shared_modules/modules/creating_po_form/creating_po_form.dart';
import 'package:mockito/annotations.dart';

import 'controllers/creating_po_form_controller.dart';
import 'views/creating_po_form_view.dart';

@GenerateNiceMocks([MockSpec<CreatingPoFormController>()])
void main() {
  late GetMaterialApp app;
  late CreatingPoFormController controller;

  setUp(() {
    app = GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const CreatingPoFormView(),
          binding: BindingsBuilder<CreatingPoFormController>.put(() => controller = CreatingPoFormController()),
        ),
      ],
    );
  });

  testWidgets('Testing Creating PO widgets.', (widgetTester) async {
    await widgetTester.pumpWidget(app);

    expect(find.byType(CpoFormTypeListener), findsNWidgets(4));
    expect(controller.type, CreatingPoFormType.values.first);

    for (int i = 0; i < 3; i++) {
      int n = 0;
      await widgetTester.tap(find.byWidgetPredicate((widget) => widget is RadioListTile && i == n++));
      await widgetTester.pump();

      expect(controller.type, CreatingPoFormType.values.elementAt(i));
      if (controller.type != CreatingPoFormType.reserved) expect(find.text('Included tax price'), findsOneWidget);
    }

    for (final e in CreatingPoFormCheckbox.values) {
      await widgetTester.tap(find.descendant(
        of: find.byWidgetPredicate((widget) => widget is CpoCheckboxListener && widget.checkbox == e),
        matching: find.byType(Checkbox),
      ));
      await widgetTester.pump();

      switch (e) {
        case CreatingPoFormCheckbox.taxPriceIncluded:
          expect(controller.taxPriceIncluded, true);
          break;
        case CreatingPoFormCheckbox.onlyFollowingCustomersAccepted:
          expect(controller.onlyFollowingCustomersAccepted, true);
          break;
        case CreatingPoFormCheckbox.vehiclePictureRequired:
          expect(controller.vehiclePictureRequired, true);
          break;
        case CreatingPoFormCheckbox.weighingSlipRequired:
          expect(controller.weighingSlipRequired, true);
          break;
        case CreatingPoFormCheckbox.agreementAccepted:
          expect(controller.aggreementAccepted, true);
          break;
      }
    }

    await widgetTester.enterText(
      find.byWidgetPredicate((element) => element is TextField && element.controller == controller.totalAcceptedAmountController),
      '50000',
    );

    await widgetTester.pump();
    expect(controller.totalAcceptedAmount, lessThanOrEqualTo(controller.maximumTotalAcceptedAmount));

    await widgetTester.enterText(
      find.byWidgetPredicate((element) => element is TextField && element.controller == controller.usedCoinsController),
      '100',
    );

    await widgetTester.pump();
    expect(controller.usedCoins, lessThanOrEqualTo(controller.remainingCoins));

    await widgetTester.enterText(
      find.byWidgetPredicate((element) => element is TextField && element.controller == controller.pricePerUnitController),
      '5000',
    );

    await widgetTester.pump();
    expect(controller.pricePerUnit, lessThanOrEqualTo(controller.maximumPricePerUnit));

    await widgetTester.enterText(
      find.byWidgetPredicate((element) => element is TextField && element.controller == controller.minimumAmountPerRoundController),
      '50000',
    );

    await widgetTester.pump();

    expect(controller.minimumAmountPerRound, lessThanOrEqualTo(controller.totalAcceptedAmount ?? 0));

    final now = DateTime.now();
    controller
      ..setStartDate(now)
      ..setEndDate(now.add(const Duration(days: 10)));

    expect(controller.confirmButtonEnabled, true);

    await widgetTester.pump();

    expect(
      widgetTester.widget(find.byType(ElevatedButton)),
      isA<ElevatedButton>().having((button) => button.onPressed != null, 'Confirm button enabled.', true),
    );
  });
}
