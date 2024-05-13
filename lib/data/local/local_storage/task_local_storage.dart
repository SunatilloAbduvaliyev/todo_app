import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';


import 'dart:async';

import '../../model/task_model/task_model.dart';


class TaskCrudController {
  late Box<TaskModel> _taskData;

  TaskCrudController() {
    _init();
  }

  Future<void> _init() async {
    _taskData = await Hive.openBox<TaskModel>('tasks');
  }


  Future<void> insertTask(TaskModel taskModel) async {
    await _taskData.put(taskModel.id, taskModel);
  }

  Future<List<TaskModel>> getAllTasks() async {
    return _taskData.values.toList();
  }


  Future<void> deleteTask({required int id}) async {
    await _taskData.delete(id);
  }
}