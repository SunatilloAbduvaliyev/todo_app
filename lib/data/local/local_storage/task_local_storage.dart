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
    debugPrint('________________________task title ${taskModel.title}');
    debugPrint('________________________task decription ${taskModel.description}');
    debugPrint('________________________task isDone ${taskModel.isDone}');
    debugPrint('________________________task id ${taskModel.id}');
    debugPrint('________________________task idSearch ${taskModel.searchId}');
    debugPrint('________________________task startTime ${taskModel.startTime}');
    debugPrint('________________________task endTime ${taskModel.endTime}');
    await _taskData.put(taskModel.id, taskModel);
  }

  Future<List<TaskModel>> getAllTasks() async {
    debugPrint('malumot olindi');
    return _taskData.values.toList();
  }


  Future<void> deleteTask({required int id}) async {
    await _taskData.delete(id);
  }
}