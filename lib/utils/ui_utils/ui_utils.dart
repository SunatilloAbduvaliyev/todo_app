import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorMessage({
  required String message,
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title:  Text(
        "message".tr,
        style: const TextStyle(fontWeight: FontWeight.w800),
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          message.tr,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          isDefaultAction: true,
          child:  Text("ok".tr),
        )
      ],
    ),
  );
}