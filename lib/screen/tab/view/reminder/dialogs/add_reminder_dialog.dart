import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app/screen/tab/view/reminder/dialog_controller.dart';
import 'package:todo_app/screen/tab/view/reminder/widget/dialog_text_field.dart';
import 'package:todo_app/utils/extension/extension.dart';
import '../../../../../utils/images/app_images.dart';

addReminderDialog({
  required BuildContext context,
}) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController tasksController = TextEditingController();
  TextEditingController renameController = TextEditingController();
  bool addTaskList = true;
  var controller = Get.put(DialogController());
  width = MediaQuery.sizeOf(context).width;
  height = MediaQuery.sizeOf(context).height;
  final FocusNode focusNodeOne = FocusNode();
  final FocusNode focusNodeTwo = FocusNode();
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        debugPrint(
            '-------------------------------------------------dialog run');
        return StatefulBuilder(
          builder: (context, setState) {
            return Form(
              key: formKey,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 10,
                      right: 10,
                      top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'create_a_note'.tr,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        5.boxH(),
                        DialogTextField(
                          controller: titleController,
                          labelText: 'title',
                        ),
                        5.boxH(),
                        if (controller.reminderList.isNotEmpty)
                          Obx(
                            () => Column(
                              children: [
                                ...List.generate(
                                  controller.reminderList.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            renameController.text =
                                                controller.reminderList[index];
                                            return AlertDialog(
                                              title: DialogTextField(
                                                controller: renameController,
                                                labelText: 'rename',
                                              ),
                                              actions: [
                                                IconButton(
                                                  onPressed: () {
                                                    controller.renameReminder(
                                                        renameController.text,
                                                        index);
                                                    renameController.clear();
                                                    Navigator.of(context).pop();
                                                  },
                                                  icon: const Icon(
                                                    Icons
                                                        .drive_file_rename_outline,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .deleteReminder(index);
                                                    renameController.clear();
                                                    Navigator.of(context).pop();
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete_forever_sharp,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          value: false,
                                          onChanged: (value) {},
                                        ),
                                        Expanded(
                                          child: Text(
                                            controller.reminderList[index],
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        5.boxH(),
                        Row(
                          children: [
                            Expanded(
                              child: DialogTextField(
                                controller: tasksController,
                                labelText: 'list_of_notes',
                                isListTask: true,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.addReminder(tasksController.text);
                                tasksController.clear();
                                if (addTaskList) {
                                  setState(() {});
                                  addTaskList = false;
                                }
                              },
                              icon: const Icon(
                                Icons.add,
                              ),
                            )
                          ],
                        ),
                        10.boxH(),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  focusNodeOne.unfocus();
                                  focusNodeTwo.unfocus();
                                  dateTime = await showDatePicker(
                                    helpText: 'Sanani Tanlang!',
                                    confirmText: "Tanlang",
                                    cancelText: "Bekor qilish",
                                    barrierDismissible: false,
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2030),
                                    currentDate: DateTime.now(),
                                  );

                                  if (dateTime != null) {
                                  }
                                },
                                icon: SvgPicture.asset(
                                  AppImages.date,
                                  width: 24.w,
                                  height: 24.h,
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(context)
                                        .colorScheme
                                        .inverseSurface,
                                    BlendMode.srcIn,
                                  ),
                                )),
                            20.boxW(),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  AppImages.time,
                                  width: 24.w,
                                  height: 24.h,
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(context)
                                        .colorScheme
                                        .inverseSurface,
                                    BlendMode.srcIn,
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      });
}
