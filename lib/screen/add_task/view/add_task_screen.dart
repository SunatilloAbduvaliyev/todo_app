import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:todo_app/screen/add_task/add_task_controller.dart';

import '../../global_widget/drawer_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  List<String> tasks = [];
  List<bool> checkTasks = [];
  List<DateTime> tasksDate = [];
  AddTaskController taskController = Get.put(AddTaskController());
  @override
  Widget build(BuildContext context) {
    debugPrint('_______________________________________build run');
    return  ThemeSwitchingArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: Text('enter_your_daily_task'.tr,style: Theme.of(context).textTheme.titleMedium,),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
