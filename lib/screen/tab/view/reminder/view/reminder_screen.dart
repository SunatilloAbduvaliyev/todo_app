import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/screen/data_controller/data_controller.dart';
import 'package:todo_app/screen/global_widget/drawer_widget.dart';
import 'package:todo_app/screen/tab/view/reminder/dialogs/add_reminder_dialog.dart';
import '../../../../../data/model/reminder_model/reminder_model.dart';
import '../../../../../utils/images/app_images.dart';
import '../../../../../utils/style/app_text_style.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  DataController dataController = Get.find<DataController>();


  @override
  Widget build(BuildContext context) {
    debugPrint('-------------------------------------------------build run');
    return ThemeSwitchingArea(
      child: SafeArea(
        child: Scaffold(
          drawerScrimColor: Theme.of(context).colorScheme.background,
          drawer: const DrawerWidget(),
          appBar: AppBar(
            title: Text('reminder_screen'.tr),
          ),
          body: Obx(()=>dataController.isLoading.value
              ? Center(child: Lottie.asset(AppImages.loading))
              : dataController.reminderList.isEmpty
              ? Center(
            child: Lottie.asset(AppImages.reminderLottie),
          )
              : ListView.builder(
              itemCount: dataController.reminderList.length,
              itemBuilder: (BuildContext context, int index) {
                debugPrint(
                    '_______________________________________list builder');
                return Container(
                    color: Theme.of(context).colorScheme.background,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 10.h),
                    margin: EdgeInsets.only(top: 5.h),
                    child: Column(children: [
                      Text(
                        dataController.reminderList[index].title,
                        style: AppTextStyle.medium
                            .copyWith(fontFamily: "Itim"),
                      ),
                      ...List.generate(
                        dataController.reminderList[index].tasks.length,
                            (taskIndex) => Obx(() => Row(
                          children: [
                            Checkbox(
                              value: dataController
                                  .reminderList[index]
                                  .isCheck[taskIndex],
                              onChanged: (value) {
                                dataController.reminderList[index]
                                    .isCheck[taskIndex] = !dataController.reminderList[index]
                                    .isCheck[taskIndex];
                                dataController.updateReminder(
                                  reminderModel: ReminderModel(
                                    id: dataController
                                        .reminderList[index].id,
                                    title: dataController
                                        .reminderList[index].title,
                                    dateTime: dataController
                                        .reminderList[index]
                                        .dateTime,
                                    isCheck: dataController
                                        .reminderList[index]
                                        .isCheck,
                                    tasks: dataController
                                        .reminderList[index].tasks,
                                  ),
                                );
                              },
                            ),
                            Text(
                              dataController.reminderList[index]
                                  .tasks[taskIndex],
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                fontFamily: 'Itim',
                                decoration: dataController
                                    .reminderList[index]
                                    .isCheck[taskIndex]
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ]));
              }),),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              addReminderDialog(context: context);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
