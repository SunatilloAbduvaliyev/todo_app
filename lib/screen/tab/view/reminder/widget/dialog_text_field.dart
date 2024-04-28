import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogTextField extends StatelessWidget {
  const DialogTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isValidate = true,
    this.isListTask = false,
  });

  final TextEditingController controller;
  final String labelText;
  final bool isValidate;
  final bool isListTask;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: isValidate
          ? (value) {
              if (value!.isEmpty) {
                return 'please_enter_task'.tr;
              }
              return null;
            }
          : null,
      maxLines: isListTask?null:1,
      maxLength: isListTask?50:null,
      controller: controller,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        labelText: labelText.tr,
      ),
    );
  }
}
