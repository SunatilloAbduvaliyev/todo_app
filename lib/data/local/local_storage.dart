import 'package:hive/hive.dart';


import 'dart:async';

import 'package:todo_app/data/model/reminder_model/reminder_model.dart';

import '../model/task_model/task_model.dart';

class DataCrudController {
  late Box<ReminderModel> _reminderData;
  late Box<TaskModel> _taskData;

  DataCrudController() {
    _init();
  }

  Future<void> _init() async {
    _reminderData = await Hive.openBox<ReminderModel>('qr');
    _taskData = await Hive.openBox<TaskModel>('tasks');
  }

  Future<List<ReminderModel>> getAllReminder() async {
    return _reminderData.values.toList();
  }

  Future<List<TaskModel>> getAllTasks() async {
    return _taskData.values.toList();
  }

  Future<void> insertReminder(ReminderModel reminderModel) async {
    await _reminderData.put(reminderModel.id, reminderModel);
  }

  void deleteData({required int id})  {
    _reminderData.delete(id);
  }
}