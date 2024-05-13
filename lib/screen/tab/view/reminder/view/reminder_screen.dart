import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/screen/global_widget/drawer_widget.dart';
import 'package:todo_app/screen/tab/view/reminder/dialogs/view/add_reminder_dialog.dart';
import 'package:todo_app/utils/extension/extension.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../../data/model/reminder_model/reminder_model.dart';
import '../../../../../utils/images/app_images.dart';
import '../../../../../utils/style/app_text_style.dart';
import '../reminder_controller.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  ReminderController dataController = Get.find<ReminderController>();
  DateTime? checkDateTime;
  Future<void> _init() async {
    await dataController.getAllReminder();
  }

  @override
  void initState() {
    _init();
    super.initState();
  }


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
          body: Obx(
            () => dataController.isLoading.value
                ? Center(child: Lottie.asset(AppImages.loading))
                : dataController.reminderList.isEmpty
                    ? Center(
                        child: Lottie.asset(AppImages.reminderLottie),
                      )
                    : ListView.builder(
                        itemCount: dataController.reminderList.length,
                        itemBuilder: (BuildContext context, int index) {
                              dataController.reminderList[index].checkCount;
                          debugPrint(
                              '_______________________________________list builder');
                          return Dismissible(
                            key: ValueKey<String>(
                                dataController.reminderList[index].title),
                            confirmDismiss: (DismissDirection direction) async {
                              if (direction == DismissDirection.startToEnd) {
                                return await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('deleting'.tr),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                          },
                                          child: Text('yes'.tr),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                          child: Text('no'.tr),
                                        )
                                      ],
                                    );
                                  },
                                );
                              } else {
                                ReminderModel reminderModel =dataController.reminderList[index];
                                await addReminderDialog(
                                  context: context,
                                  reminderModel:
                                      dataController.reminderList[index],
                                    checkDateTime: checkDateTime!.copyWith(
                                      day: reminderModel.dateTime.day,
                                      month: reminderModel.dateTime.month,
                                      year:reminderModel.dateTime.year,
                                      hour:reminderModel.dateTime.hour,
                                      minute:reminderModel.dateTime.minute,
                                    )
                                );
                              }
                            },
                            onDismissed: (direction) {
                              dataController.deleteReminder(
                                  id: dataController.reminderList[index].id);
                            },
                            background: Container(
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              color: Colors.red,
                              child: Center(
                                child: Text(
                                  "deleting".tr,
                                  style: AppTextStyle.semiBold.copyWith(
                                    fontSize: 20,
                                    letterSpacing: 5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            secondaryBackground: Container(
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              color: Colors.green,
                              child: Center(
                                child: Text(
                                  "rename".tr,
                                  style: AppTextStyle.semiBold.copyWith(
                                    fontSize: 20,
                                    letterSpacing: 5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            child: Container(
                              color: Theme.of(context).colorScheme.background,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              margin: EdgeInsets.only(top: 5.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataController.reminderList[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          fontFamily: 'Itim',
                                        ),
                                  ),
                                  ...List.generate(
                                    dataController
                                        .reminderList[index].tasks.length,
                                    (taskIndex) => Obx(
                                      () => ZoomTapAnimation(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: dataController
                                                  .reminderList[index]
                                                  .isCheck[taskIndex],
                                              onChanged: (value) {
                                                dataController
                                                        .reminderList[index]
                                                        .isCheck[taskIndex] =
                                                    !dataController
                                                        .reminderList[index]
                                                        .isCheck[taskIndex];
                                                dataController.updateReminder(
                                                  reminderModel: ReminderModel(
                                                    dateOrder: dataController
                                                        .reminderList[index]
                                                        .dateOrder,
                                                    id: dataController
                                                        .reminderList[index].id,
                                                    title: dataController
                                                        .reminderList[index]
                                                        .title,
                                                    dateTime: dataController
                                                        .reminderList[index]
                                                        .dateTime,
                                                    isCheck: dataController
                                                        .reminderList[index]
                                                        .isCheck,
                                                    tasks: dataController
                                                        .reminderList[index]
                                                        .tasks,
                                                    checkCount: 0,
                                                  ),
                                                );
                                              },
                                            ),
                                            Text(
                                              dataController.reminderList[index]
                                                  .tasks[taskIndex],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge!
                                                  .copyWith(
                                                    fontFamily: 'Itim',
                                                    decoration: dataController
                                                            .reminderList[index]
                                                            .isCheck[taskIndex]
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppImages.date,
                                        width: 24.w,
                                        height: 24.h,
                                        colorFilter: ColorFilter.mode(
                                          Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      10.boxW(),
                                      Text(
                                        DateFormat('EEEE, MMMM dd, y, HH:mm')
                                            .format(dataController
                                                .reminderList[index].dateTime),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                              fontFamily: 'Itim',
                                            ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              addReminderDialog(
                context: context,
                reminderModel: null,
                checkDateTime: checkDateTime!.copyWith(
                  day: DateTime.now().day,
                  month: DateTime.now().month,
                  year: DateTime.now().year,
                  hour:TimeOfDay.now().hour,
                  minute: TimeOfDay.now().minute,
                )
              );
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
