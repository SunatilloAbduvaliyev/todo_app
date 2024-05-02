import 'package:get/get.dart';

class DialogController extends GetxController{
  RxBool isSpecific = false.obs;
  RxList reminderList = [].obs;
  RxList checkReminderList = [].obs;
  void addReminder(String reminder){
    reminderList.add(reminder);
    checkReminderList.add(false);
  }

  void deleteReminder(int index){
    reminderList.removeAt(index);
    checkReminderList.removeAt(index);
  }

  void renameReminder(String newReminder, int index){
    reminderList.removeAt(index);
    reminderList.insert(index, newReminder);
  }

  void clearLists(){
    reminderList.clear();
    checkReminderList.clear();
  }



}