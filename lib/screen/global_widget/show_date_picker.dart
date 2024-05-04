import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<DateTime?> showDatePickerWithContext(BuildContext context) async {
  DateTime? selectedDate = await showDatePicker(
    context: context,
    helpText: 'select_a_date'.tr,
    confirmText: "choose".tr,
    cancelText: "cancel".tr,
    barrierDismissible: false,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2030),
  );
  return selectedDate;
}
