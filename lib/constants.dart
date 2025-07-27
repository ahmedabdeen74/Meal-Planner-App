import 'package:flutter/material.dart';

const kPrimaryColor = Colors.black;
const kSecondaryColor = Colors.white;
//const kGreyColor = Color(0xff878787);
void hideKeyboardFromScreen(BuildContext context) {
  final currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Color(0xffEEEFF3)),
  );
}
