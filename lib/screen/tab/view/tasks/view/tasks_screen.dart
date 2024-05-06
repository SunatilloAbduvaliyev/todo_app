import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screen/add_task/add_task_controller.dart';
import 'package:todo_app/screen/global_widget/global_button.dart';
import 'package:todo_app/screen/route.dart';
import 'package:todo_app/screen/tab/view/tasks/tasks_controller.dart';
import 'package:todo_app/utils/extension/extension.dart';
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
    debugPrint('__________________________________________build run');
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
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
                        Get.put(AddTaskController()).setDateTime(dateTime!, TimeOfDay.now());
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
