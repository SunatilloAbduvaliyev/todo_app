import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/model/reminder_model/reminder_model.dart';
import 'package:todo_app/screen/global_widget/show_time_picker.dart';
import 'package:todo_app/screen/tab/view/reminder/dialogs/dialog_controller.dart';
import 'package:todo_app/screen/tab/view/reminder/widget/dialog_text_field.dart';
import 'package:todo_app/utils/extension/extension.dart';
import 'package:todo_app/utils/ui_utils/ui_utils.dart';
import '../../../../../../utils/images/app_images.dart';
import '../../../../../global_widget/global_button.dart';
import '../../../../../global_widget/show_date_picker.dart';
import '../../reminder_controller.dart';

addReminderDialog({
  required BuildContext context,
  ReminderModel? reminderModel,
  required DateTime checkDateTime,
}) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool addTaskList = true;
  DialogController controller = Get.put(DialogController());
  ReminderController dataController = Get.put(ReminderController());
  TextEditingController titleController = TextEditingController();
  TextEditingController tasksController = TextEditingController();
  TextEditingController renameController = TextEditingController();
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  if (reminderModel != null) {
    titleController = TextEditingController(text: reminderModel.title);
    controller.updateReminder(
      taskList: reminderModel.tasks,
      checkList: reminderModel.isCheck,
    );
    dateTime = reminderModel.dateTime;
    timeOfDay = TimeOfDay(
      hour: reminderModel.dateTime.hour,
      minute: reminderModel.dateTime.minute,
    );
  } else {
    controller.dateTrueIsError();
    controller.timeTrueIsError();
    controller.clearLists();
    titleController = TextEditingController();
    tasksController = TextEditingController();
    renameController = TextEditingController();
  }
  width = context.width;
  height = context.height;
  final FocusNode focusNodeOne = FocusNode();
  final FocusNode focusNodeTwo = FocusNode();
  final FocusNode focusNodeThree = FocusNode();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      debugPrint('-------------------------------------------------dialog run');
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
                        focusNode: focusNodeThree,
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
                                              focusNode: focusNodeOne,
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
                            child: Obx(
                              () => DialogTextField(
                                focusNode: focusNodeTwo,
                                controller: tasksController,
                                labelText: 'list_of_notes',
                                isListTask: true,
                                isValidate: controller.taskIsEmpty.value,
                              ),
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
                              focusNodeThree.unfocus();
                              dateTime =
                                  await showDatePickerWithContext(context);
                              if (dateTime != null) {
                                if (reminderModel != null) {
                                  if (dateTime == checkDateTime) {
                                    if (dateTime!.hour >= timeOfDay!.hour &&
                                        dateTime!.minute >= timeOfDay!.minute) {
                                      if (!context.mounted) return;
                                      showErrorMessage(
                                        message: 'reminder_time_error_one',
                                        context: context,
                                      );
                                      dateTime = null;
                                      controller.dateTimeIsError();
                                    } else {
                                      controller.dateTrueIsError();
                                    }
                                  } else {
                                    dateTime = dateTime!.copyWith(
                                      hour: timeOfDay!.hour,
                                      minute: timeOfDay!.minute,
                                    );
                                    controller.dateTrueIsError();
                                  }
                                } else if (timeOfDay == null) {
                                  controller.dateTrueIsError();
                                } else if (checkDateTime.hour >=
                                        timeOfDay!.hour &&
                                    checkDateTime.minute >= timeOfDay!.minute) {
                                  if (!context.mounted) return;
                                  showErrorMessage(
                                    message: 'reminder_time_error_one',
                                    context: context,
                                  );
                                  dateTime == null;
                                  controller.dateTimeIsError();
                                } else {
                                  controller.dateTrueIsError();
                                }
                              }
                            },
                            icon: Obx(
                              () => SvgPicture.asset(
                                AppImages.date,
                                width: 24.w,
                                height: 24.h,
                                colorFilter: ColorFilter.mode(
                                  controller.dateTimeIsError.value
                                      ? Colors.red
                                      : Theme.of(context)
                                          .colorScheme
                                          .inverseSurface,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          20.boxW(),
                          IconButton(
                            onPressed: () async {
                              focusNodeOne.unfocus();
                              focusNodeTwo.unfocus();
                              focusNodeThree.unfocus();
                              timeOfDay =
                                  await showTimePickerWithContext(context);
                              if (timeOfDay != null) {
                                if (reminderModel != null) {
                                  if(dateTime!=checkDateTime){
                                    dateTime = dateTime!.copyWith(
                                      hour: timeOfDay!.hour,
                                      minute: timeOfDay!.minute,
                                    );
                                    controller.dateTrueIsError();
                                  }else if (dateTime!.hour >= timeOfDay!.hour &&
                                      dateTime!.minute >= timeOfDay!.minute) {
                                    if (!context.mounted) return;
                                    showErrorMessage(
                                      message: 'reminder_time_error_one',
                                      context: context,
                                    );
                                    dateTime = null;
                                    controller.dateTimeIsError();
                                  }else{
                                    dateTime = dateTime!.copyWith(
                                      hour: timeOfDay!.hour,
                                      minute: timeOfDay!.minute,
                                    );
                                    controller.dateTrueIsError();
                                  }
                                }
                                else if (checkDateTime.hour >= timeOfDay!.hour &&
                                    checkDateTime.minute >= timeOfDay!.minute) {
                                  if (!context.mounted) return;
                                  showErrorMessage(
                                    message: 'reminder_time_error_one',
                                    context: context,
                                  );
                                  dateTime = null;
                                  controller.timeOfIsError();
                                }else{
                                  controller.timeTrueIsError();
                                }
                              }
                            },
                            icon: Obx(
                              () => SvgPicture.asset(
                                AppImages.time,
                                width: 24.w,
                                height: 24.h,
                                colorFilter: ColorFilter.mode(
                                  controller.timeOfIsError.value
                                      ? Colors.red
                                      : Theme.of(context)
                                          .colorScheme
                                          .inverseSurface,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          GlobalButton(
                            title: reminderModel != null
                                ? 'rename'.tr
                                : 'create'.tr,
                            onTap: () {
                              if (reminderModel == null) {
                                if (formKey.currentState!.validate() &&
                                    controller.reminderList.isNotEmpty &&
                                    dateTime != null &&
                                    timeOfDay != null) {
                                  dataController.insertReminder(
                                    reminderModel: ReminderModel(
                                      id: DateTime.now().microsecond,
                                      dateOrder: DateTime.now(),
                                      title: titleController.text,
                                      tasks: controller.reminderList
                                          .map<String>((e) => e.toString())
                                          .toList(),
                                      isCheck: controller.checkReminderList
                                          .map(
                                            (element) => element ? true : false,
                                          )
                                          .toList(),
                                      dateTime: dateTime!,
                                      checkCount: 0,
                                    ),
                                  );
                                  controller.clearLists();
                                  Navigator.pop(context);
                                }
                                if (dateTime == null) {
                                  controller.dateFalseIsError();
                                }
                                if (timeOfDay == null) {
                                  controller.timeFalseIsError();
                                }
                              } else {
                                if (formKey.currentState!.validate() &&
                                    controller.reminderList.isNotEmpty) {
                                  dataController.insertReminder(
                                    reminderModel: ReminderModel(
                                      id: reminderModel.id,
                                      dateOrder: reminderModel.dateOrder,
                                      title: titleController.text,
                                      tasks: controller.reminderList
                                          .map<String>((e) => e.toString())
                                          .toList(),
                                      isCheck: controller.checkReminderList
                                          .map(
                                            (element) => element ? true : false,
                                          )
                                          .toList(),
                                      dateTime: dateTime!,
                                      checkCount: reminderModel.checkCount,
                                    ),
                                  );
                                  controller.clearLists();
                                  Navigator.pop(context);
                                }
                              }
                            },
                            color: Colors.amber,
                          ),
                          20.boxH(),
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
    },
  );
}
