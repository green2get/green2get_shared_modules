import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green2get_shared_modules/green2get_shared_modules.dart';

import '../controllers/po_board_controller.dart';
import '../models/po_board_model.dart';

class PoBoardView extends GetView<PoBoardController> {
  const PoBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: PoBoard(
          controller: controller,
          child: PobItemsListener<PoBoardModel>((_, items) {
            if (items.isEmpty) return const SizedBox();
            return Column(
              children: [
                for (final e in items)
                  Wrap(children: [
                    PobAmountCounterListener(e, (context, value) => Text(value.toStringAsFixed(2))),
                    PobCountdownTimerListener(e, (context, remainingDuration) => Text('${remainingDuration.inSeconds}')),
                    PobItemAttachedButtonListener(
                        e, (context, enabled) => ElevatedButton(onPressed: enabled ? () {} : null, child: const Text('open'))),
                    // PobItem(item: e, frameBuilder: (context, child) => Container(child: child))
                  ]),
              ],
            );
          }),
        ),
      ),
    );
  }
}
