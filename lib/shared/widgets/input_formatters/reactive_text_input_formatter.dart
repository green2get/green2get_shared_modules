import 'package:flutter/services.dart';

class ReactiveTextInputFormatter extends TextInputFormatter {
  final TextInputFormatter Function() callback;

  ReactiveTextInputFormatter(this.callback);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return callback().formatEditUpdate(oldValue, newValue);
  }
}
