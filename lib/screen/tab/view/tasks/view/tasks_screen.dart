import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/screen/add_task/add_task_controller.dart';
import 'package:todo_app/screen/global_widget/global_button.dart';
import 'package:todo_app/screen/route.dart';
import 'package:todo_app/screen/controller/tasks_controller.dart';
import 'package:todo_app/utils/extension/extension.dart';
import 'package:todo_app/utils/images/app_images.dart';
import '../../../../global_widget/drawer_widget.dart';
import '../../../../theme/app_theme.dart';
import '../widget/task_item.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  var darkTheme = AppTheme.darkTheme;
  var lightTheme = AppTheme.lightTheme;
  TasksController tasksController = Get.put(TasksController());
  DateTime now = DateTime.now();
  DateTime? dateTime;

  Future<void> _init(DateTime date) async {
    await tasksController.getAllTasks(DateTime(date.year, date.month, date.day, 0, 0, 0));
  }

  @override
  void initState() {
    super.initState();
  }

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
        body: SingleChildScrollView(
          child: Column(
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
                          Get.put(AddTaskController()).setDateTime(
                              DateTime(now.year, now.month, now.day, 0, 0, 0),
                              TimeOfDay.now());
                        } else {
                          Get.put(AddTaskController())
                              .setDateTime(dateTime!, TimeOfDay.now());
                        }
                        Navigator.pushNamed(context, RouteName.addTaskScreen,
                        arguments: (value){
                          _init(value);
                          setState(() {});
                        });
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
                  () => tasksController.tasksList.isEmpty?Center(child: Lottie.asset(AppImages.empty),):Column(
                      children: [
                  ...List.generate(tasksController.tasksList.length, (index) {
                    debugPrint('___________________________--obx run');
                    return TaskItem(taskModel:tasksController.tasksList[index], index:index );
                  })
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
