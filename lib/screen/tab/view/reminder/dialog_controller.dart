import 'package:get/get.dart';

class DialogController extends GetxController{
  RxBool isSpecific = false.obs;
  RxList reminderList = [].obs;
  RxList checkReminderList = [].obs;
  RxBool dateTimeIsError = false.obs;
  RxBool timeOfIsError = false.obs;
  RxBool taskIsEmpty = false.obs;
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


  void updateReminder({required List<String> taskList, required List<bool> checkList}){
    reminderList.value = taskList;
    checkReminderList.value = checkList;
  }

  void dateFalseIsError()=>dateTimeIsError.value = true;
  void dateTrueIsError()=>dateTimeIsError.value = false;
  void timeFalseIsError()=>timeOfIsError.value = true;
  void timeTrueIsError()=>timeOfIsError.value = false;
  void tasksIsEmpty()=>taskIsEmpty.value = true;
  void tasksIsNotEmpty()=>taskIsEmpty.value = false;
}