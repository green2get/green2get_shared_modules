import 'package:flutter/services.dart';

class ReactiveTextInputFormatter extends TextInputFormatter {
  // final TextInputFormatter Function() callback;
  final TextEditingValue Function(TextEditingValue oldValue, TextEditingValue newValue) updateCallback;

  ReactiveTextInputFormatter(this.updateCallback);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return updateCallback(oldValue, newValue);
  }
}
