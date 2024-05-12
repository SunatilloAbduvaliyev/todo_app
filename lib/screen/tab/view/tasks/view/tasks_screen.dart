import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screen/add_task/add_task_controller.dart';
import 'package:todo_app/screen/global_widget/global_button.dart';
import 'package:todo_app/screen/route.dart';
import 'package:todo_app/screen/controller/tasks_controller.dart';
import 'package:todo_app/utils/extension/extension.dart';
import 'package:todo_app/utils/images/app_images.dart';
import 'package:todo_app/utils/style/app_text_style.dart';
import '../../../../../data/model/task_model/task_model.dart';
import '../../../../global_widget/drawer_widget.dart';
import '../../../../theme/app_theme.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  var darkTheme = AppTheme.darkTheme;
  var lightTheme = AppTheme.lightTheme;
  TasksController tasksController = Get.put(TasksController());
  DateTime? dateTime;



  @override
  Widget build(BuildContext context) {
    width = context.width;
    height = context.height;
    debugPrint('__________________________________________build run');
    return ThemeSwitchingArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: Text('task_screen'.tr),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      tasksController.dateTime.value,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  GlobalButton(
                    title: 'add_a_task',
                    onTap: () {
                      if (dateTime == null) {
                        Get.put(AddTaskController())
                            .setDateTime(DateTime.now(), TimeOfDay.now());
                      } else {
                        Get.put(AddTaskController())
                            .setDateTime(dateTime!, TimeOfDay.now());
                      }
                      Navigator.pushNamed(context, RouteName.addTaskScreen);
                    },
                    color: const Color(0xFF8875FF),
                  ),
                ],
              ),
            ),
            20.boxH(),
            SizedBox(
              height: 100.hSize,
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectedTextColor: Colors.white,
                monthTextStyle: Theme.of(context).textTheme.labelMedium!,
                dateTextStyle: Theme.of(context).textTheme.labelLarge!,
                dayTextStyle: Theme.of(context).textTheme.labelSmall!,
                selectionColor: const Color(0xFF8875FF),
                onDateChange: (date) {
                  dateTime = date;
                  tasksController.changedDate(date);
                  tasksController.searchTask(date);
                },
              ),
            ),
            10.boxH(),
            if (tasksController.tasksList.isNotEmpty)
              Obx(
                () => Column(
                  children: [
                    ...List.generate(tasksController.tasksList.length, (index) {
                      TaskModel taskModel = tasksController.tasksList[index];
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(
                              hexStringToHexInt(taskModel.color),
                            ),
                            borderRadius: BorderRadius.circular(10).r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              taskModel.title,
                              style: AppTextStyle.bold.copyWith(
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              taskModel.description,
                              style: AppTextStyle.regular.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.date,
                                  width: 30.w,
                                  height: 30.h,
                                ),
                                Text(
                                  DateFormat('EEEE, MMMM dd, y, HH:mm')
                                      .format(taskModel.startTime),
                                  style: AppTextStyle.regular.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.date,
                                  width: 30.w,
                                  height: 30.h,
                                ),
                                Text(
                                  DateFormat('EEEE, MMMM dd, y, HH:mm')
                                      .format(taskModel.endTime),
                                  style: AppTextStyle.regular.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                          .animate(
                            delay: Duration(milliseconds: (200 + index * 100)),
                          )
                          .slideX();
                    })
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
