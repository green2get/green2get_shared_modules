import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';

import '../shared/widgets/input_formatters/reactive_text_input_formatter.dart';

// หน้าสร้างรายการ PO

part 'creating_po_form/controllers/mixins/creating_po_form_mixin.dart';
part 'creating_po_form/models/enums/creating_po_form_checkbox.dart';
part 'creating_po_form/models/enums/creating_po_form_type.dart';
part 'creating_po_form/views/widgets/cpo_checkbox_listener.dart';
part 'creating_po_form/views/widgets/cpo_confirm_button_listener.dart';
part 'creating_po_form/views/widgets/cpo_form_mode_listener.dart';
part 'creating_po_form/views/creating_po_form_view.dart';

// หน้าบอร์ดสถานะ PO

part 'po_history_board/controllers/mixins/po_history_board_mixin.dart';
part 'po_history_board/views/po_history_board_view.dart';
