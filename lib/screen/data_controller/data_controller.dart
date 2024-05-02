import 'package:get/get.dart';

import '../../data/local/local_storage.dart';
import '../../data/model/reminder_model/reminder_model.dart';
import '../../services/services_locator.dart';


class DataController extends GetxController{
  RxBool isLoading = false.obs;
  RxList reminderList = [].obs;
  RxList checkReminderList = [].obs;
  RxString errorMessage = "".obs;
  Future<void> getAllReminders() async {
    isLoading.value = true;
    try {
      List<ReminderModel> data = await getIt.get<ReminderCrudController>().getAllQr();
      if(data.isNotEmpty){
        data.sort((a, b) => b.dateOrder.compareTo(a.dateOrder));
        reminderList.value = data;
      }else{
        reminderList.value = [];
      }
    } catch (error) {
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> insertReminder({required ReminderModel reminderModel}) async {
    isLoading.value = true;
    try {
      await getIt.get<ReminderCrudController>().insertReminder(reminderModel);
      getAllReminders();
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }


  Future<void> updateReminder({required ReminderModel reminderModel}) async {
    try {
      await getIt.get<ReminderCrudController>().insertReminder(reminderModel);
      List<ReminderModel> data = await getIt.get<ReminderCrudController>().getAllQr();
      data.sort((a, b) => b.dateOrder.compareTo(a.dateOrder));
      reminderList.value = data;
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }

  void deleteReminder({required int id}){
    isLoading.value = true;
    try {
      getIt.get<ReminderCrudController>().deleteReminder(id: id);
      getAllReminders();
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }

  Future<void> restartReminder()async{
    isLoading.value = true;
    try {
      List<ReminderModel>  data = await getIt.get<ReminderCrudController>().getAllQr();
      await Future.forEach(data, (element){
        getIt.get<ReminderCrudController>().deleteReminder(id: element.id);
      });
      getAllReminders();
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }

}