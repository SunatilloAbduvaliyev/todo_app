import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screen/tab/view/reminder/dialog_controller.dart';
import 'package:todo_app/screen/tab/view/reminder/widget/dialog_text_field.dart';
import 'package:todo_app/utils/extension/extension.dart';

addReminderDialog({
  required BuildContext context,
}) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController tasksController = TextEditingController();
  bool addTaskList = true;
  var controller = Get.put(DialogController());
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        debugPrint('-------------------------------------------------dialog run');
        return StatefulBuilder(
          builder: (context, setState){
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
                          Obx(()=>
                              Column(
                                children: [
                                  ...List.generate(
                                    controller.reminderList.length,
                                        (index) => GestureDetector(
                                      onTap: () {

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
                                              style: Theme.of(context).textTheme.titleSmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
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
                                if(addTaskList){
                                  setState((){});
                                  addTaskList = false;
                                }
                              },
                              icon: const Icon(
                                Icons.add,
                              ),
                            )
                          ],
                        ),
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
