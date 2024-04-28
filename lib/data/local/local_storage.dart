import 'package:hive/hive.dart';


import 'dart:async';

import 'package:todo_app/data/model/reminder_model/reminder_model.dart';

class ReminderCrudController {
  late Box<ReminderModel> _reminderData;

  ReminderCrudController() {
    _init();
  }

  Future<void> _init() async {
    _reminderData = await Hive.openBox<ReminderModel>('qr');
  }

  Future<List<ReminderModel>> getAllQr() async {
    return _reminderData.values.toList();
  }

  Future<void> insertReminder(ReminderModel reminderModel) async {
    await _reminderData.put(reminderModel.id, reminderModel);
  }

  void deleteReminder({required int id})  {
    _reminderData.delete(id);
  }
}