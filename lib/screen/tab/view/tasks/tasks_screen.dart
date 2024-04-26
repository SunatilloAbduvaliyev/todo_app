
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widget/drawer_widget.dart';
import '../../../theme/app_theme.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  var darkTheme = AppTheme.darkTheme;
  var lightTheme = AppTheme.lightTheme;
  @override
  Widget build(BuildContext context) {
    return  ThemeSwitchingArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar:  AppBar(
          title:  Text('task_screen'.tr),
          actions: [


          ],
        ),
      ),
    );
  }
}
