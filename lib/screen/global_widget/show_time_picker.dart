import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<TimeOfDay?> showTimePickerWithContext(BuildContext context) async {
  TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    helpText: 'select_a_time'.tr,
    confirmText: "choose".tr,
    cancelText: "cancel_time".tr,
    initialEntryMode: TimePickerEntryMode.input,
    initialTime: const TimeOfDay(hour: 8, minute: 0),
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      );
    },
  );
  return selectedTime;
}
