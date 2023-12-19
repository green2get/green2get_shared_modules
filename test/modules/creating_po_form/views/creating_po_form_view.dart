import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green2get_shared_modules/green2get_shared_modules.dart';

import '../controllers/creating_po_form_controller.dart';

/// วิดเจ็ตตัวอย่างของหน้าสร้าง PO
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
              // ปุ่มตัวเลือกประเภท PO
              for (final e in CreatingPoFormType.values)
                CpoFormTypeListener((_, type) => RadioListTile<CreatingPoFormType>(
                      value: e,
                      groupValue: type,
                      title: Text(e.name),
                      onChanged: (_) => controller.setType(e),
                    )),
              // แสดงข้อความ เมื่ออยู่ในโหมดที่ไม่ใช่ [CreatingPoFormType.reserved]
              CpoFormTypeListener((_, type) {
                if (type == CreatingPoFormType.reserved) return const SizedBox();
                return const Text('Included tax price');
              }),

              /// Checkbox ทั้งหลาย
              CpoCheckboxListener(
                CreatingPoFormCheckbox.taxPriceIncluded,
                (context, value) => Checkbox(
                  value: value,
                  onChanged: (_) => controller.toggleTaxPriceIncluded(),
                ),
              ),
              CpoCheckboxListener(
                CreatingPoFormCheckbox.onlyFollowingCustomersAccepted,
                (context, value) => Checkbox(
                  value: value,
                  onChanged: (_) => controller.toggleOnlyFollowingCustomersAccepted(),
                ),
              ),
              CpoCheckboxListener(
                CreatingPoFormCheckbox.vehiclePictureRequired,
                (context, value) => Checkbox(
                  value: value,
                  onChanged: (_) => controller.toggleVehiclePictureRequired(),
                ),
              ),
              CpoCheckboxListener(
                CreatingPoFormCheckbox.weighingSlipRequired,
                (context, value) => Checkbox(
                  value: value,
                  onChanged: (_) => controller.toggleWeighingSlipRequired(),
                ),
              ),
              CpoCheckboxListener(
                CreatingPoFormCheckbox.agreementAccepted,
                (context, value) => Checkbox(
                  value: value,
                  onChanged: (_) => controller.toggleAgreementAccepted(),
                ),
              ),

              // TextField ทั้งหลาย
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
              // ปุ่มยืนยัน
              CpoConfirmButtonListener((context, enabled) => ElevatedButton(onPressed: enabled ? () {} : null, child: const Text('Confirm')))
            ],
          ),
        ),
      ),
    );
  }
}
