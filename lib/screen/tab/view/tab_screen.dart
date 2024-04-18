import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/screen/tab/tab_controller.dart';
import 'package:todo_app/screen/tab/view/reminder/reminder_screen.dart';
import 'package:todo_app/screen/tab/view/tasks/tasks_screen.dart';
import '../../../utils/images/app_images.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  final List<Widget> screens = [const ReminderScreen(), const TasksScreen()];
  var tabController = Get.put(TabBoxController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => screens[tabController.tabIndex.value]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabController.tabIndex.value,
          onTap: tabController.changeTab,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                AppImages.reminder,
                width: 24.w,
                height: 24.h,
                fit: BoxFit.cover,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Reminders',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppImages.tasks,
                width: 24.w,
                height: 24.h,
                fit: BoxFit.cover,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Tasks',
            ),
          ],
        ),
      ),
    );
  }
}
