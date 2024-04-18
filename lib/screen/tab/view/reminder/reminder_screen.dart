import 'package:flutter/material.dart';
import 'package:todo_app/screen/global_widget/drawer_widget.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const DrawerWidget(),
      appBar:  AppBar(
        title: const Text('Reminder Screen'),
      ),
    );
  }
}
