import 'package:flutter/material.dart';
import 'package:todo_app/screen/splash/splash_screen.dart';
import 'package:todo_app/screen/tab/view/reminder/view/reminder_screen.dart';
import 'package:todo_app/screen/tab/view/tab_screen.dart';
import 'package:todo_app/screen/tab/view/tasks/tasks_screen.dart';
import 'on_bording/view/on_bording_screen.dart';

class AppRoute {
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.splashScreen:
        return navigate(const SplashScreen());

      case RouteName.onBoardingScreen:
        return navigate(const OnBoardingScreen());

      case RouteName.tabBoxScreen:
        return navigate(const TabBoxScreen());

      case RouteName.reminderScreen:
        return navigate(const TasksScreen());

      case RouteName.taskScreen:
        return navigate(const ReminderScreen());

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text('404'),
            ),
          ),
        );
    }
  }
  static navigate(Widget widget) => MaterialPageRoute(builder: (context)=>widget);
}

class RouteName{
  static const String splashScreen = '/';
  static const String onBoardingScreen = '/onBoarding';
  static const String tabBoxScreen = '/tab';
  static const String taskScreen = '/task';
  static const String reminderScreen = '/reminder';
}