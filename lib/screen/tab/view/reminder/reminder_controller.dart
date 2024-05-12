import 'package:get/get.dart';
import '../../../../data/local/local_storage/reminder_local_storage.dart';
import '../../../../data/model/reminder_model/reminder_model.dart';
import '../../../../services/services_locator.dart';


class ReminderController extends GetxController{
  RxBool isLoading = false.obs;
  RxList reminderList = [].obs;
  RxList checkReminderList = [].obs;
  RxString errorMessage = "".obs;

  Future<void> getAllReminder() async {
    isLoading.value = true;
    try {
      List<ReminderModel> data = await getIt.get<DataCrudController>().getAllReminder();
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
      await getIt.get<DataCrudController>().insertReminder(reminderModel);
      getAllReminder();
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }


  Future<void> updateReminder({required ReminderModel reminderModel}) async {
    try {
      await getIt.get<DataCrudController>().insertReminder(reminderModel);
      List<ReminderModel> data = await getIt.get<DataCrudController>().getAllReminder();
      data.sort((a, b) => b.dateOrder.compareTo(a.dateOrder));
      reminderList.value = data;
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }

  Future<void> deleteReminder({required int id})async{
    isLoading.value = true;
    try {
      await getIt.get<DataCrudController>().deleteReminder(id: id);
      getAllReminder();
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }

  Future<void> restartReminder()async{
    isLoading.value = true;
    try {
      List<ReminderModel>  data = await getIt.get<DataCrudController>().getAllReminder();
      await Future.forEach(data, (element){
         getIt.get<DataCrudController>().deleteReminder(id: element.id);
      });
      getAllReminder();
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }

}