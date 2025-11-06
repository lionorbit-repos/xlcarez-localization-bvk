import 'package:XLcarez/env/appexports.dart';

class NoLeadingTrailingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    // Remove leading and trailing spaces
    newText = newText.trimLeft();
    // Update cursor position
    int newSelectionIndex = newValue.selection.baseOffset;
    if (newSelectionIndex > newText.length) {
      newSelectionIndex = newText.length;
    }
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newSelectionIndex),
    );
  }
}

class AlphabetTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Using a regular expression to allow only alphabets
    //r'^[a-zA-Z\s]*$'
    //r'^[a-zA-Z]{2,}[a-zA-Z\s]*$'
    final String newText = newValue.text;
    if(newText==" "){
      return  oldValue;
    }
   else if (RegExp(r'^[a-zA-Z\s]*$').hasMatch(newText)) {
      return newValue;
    }
    return oldValue;  // Ignore the update if it contains non-alphabet characters
  }
}