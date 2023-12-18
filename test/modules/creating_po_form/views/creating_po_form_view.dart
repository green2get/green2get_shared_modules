import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green2get_shared_modules/green2get_shared_modules.dart';

import '../controllers/creating_po_form_controller.dart';

class CreatingPoFormView extends GetView<CreatingPoFormController> {
  const CreatingPoFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: CreatingPoForm(
          controller: controller,
          child: Column(
            children: [
              for (final e in CreatingPoFormType.values)
                FormTypeListener((_, type) => RadioListTile<CreatingPoFormType>(
                      value: e,
                      groupValue: type,
                      title: Text(e.name),
                      onChanged: (_) => controller.setType(e),
                    )),
              FormTypeListener((_, type) {
                if (type == CreatingPoFormType.reserved) return const SizedBox();
                return const Text('Included tax price');
              }),
              CheckboxListener(
                CreatingPoFormCheckbox.taxPriceIncluded,
                (context, value) => Checkbox(
                  value: value,
                  onChanged: (_) => controller.toggleTaxPriceIncluded(),
                ),
              ),
              CheckboxListener(
                CreatingPoFormCheckbox.onlyFollowingCustomersAccepted,
                (context, value) => Checkbox(
                  value: value,
                  onChanged: (_) => controller.toggleOnlyFollowingCustomersAccepted(),
                ),
              ),
              CheckboxListener(
                CreatingPoFormCheckbox.vehiclePictureRequired,
                (context, value) => Checkbox(
                  value: value,
                  onChanged: (_) => controller.toggleVehiclePictureRequired(),
                ),
              ),
              CheckboxListener(
                CreatingPoFormCheckbox.weighingSlipRequired,
                (context, value) => Checkbox(
                  value: value,
                  onChanged: (_) => controller.toggleWeighingSlipRequired(),
                ),
              ),
              CheckboxListener(
                CreatingPoFormCheckbox.agreementAccepted,
                (context, value) => Checkbox(
                  value: value,
                  onChanged: (_) => controller.toggleAgreementAccepted(),
                ),
              ),
              TextField(
                controller: controller.totalAcceptedAmountController,
                inputFormatters: [controller.totalAcceptedAmountFormatter],
              ),
              TextField(
                controller: controller.minimumAmountPerRoundController,
                inputFormatters: [controller.minimumAmountPerRoundFormatter],
              ),
              TextField(
                controller: controller.usedCoinsController,
                inputFormatters: [controller.usedCoinsFormatter],
              ),
              TextField(
                controller: controller.pricePerUnitController,
                inputFormatters: [controller.pricePerUnitFormatter],
              ),
              TextField(controller: controller.detailsController),
            ],
          ),
        ),
      ),
    );
  }
}
