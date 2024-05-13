import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';


import 'dart:async';

import 'package:todo_app/data/model/reminder_model/reminder_model.dart';

import '../../model/task_model/task_model.dart';

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
  //ReminderModel
  Future<List<ReminderModel>> getAllReminder() async {
    return _reminderData.values.toList();
  }

  Future<void> insertReminder(ReminderModel reminderModel) async {
    await _reminderData.put(reminderModel.id, reminderModel);
  }

  Future<void> deleteReminder({required int id})  async{
    await _reminderData.delete(id);
  }

  //TaskModel
  Future<void> insertTask(TaskModel taskModel) async {
    _taskData = await Hive.openBox<TaskModel>('tasks');
    await _taskData.put(taskModel.id, taskModel);
  }

  Future<List<TaskModel>> getAllTasks() async {
    _taskData = await Hive.openBox<TaskModel>('tasks');
    return _taskData.values.toList();
  }


  Future<void> deleteTask({required DateTime id}) async {
    await _taskData.delete(id);
  }
}