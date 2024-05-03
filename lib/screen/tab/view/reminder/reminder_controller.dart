import 'package:get/get.dart';
import '../../../../data/local/local_storage.dart';
import '../../../../data/model/reminder_model/reminder_model.dart';
import '../../../../services/services_locator.dart';


class DataController extends GetxController{
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

  Future<void> insertReminder({required ReminderModel dataModel}) async {
    isLoading.value = true;
    try {
      await getIt.get<DataCrudController>().insertReminder(dataModel);
      getAllReminder();
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }


  Future<void> updateReminder({required ReminderModel dataModel}) async {
    try {
      await getIt.get<DataCrudController>().insertReminder(dataModel);
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
      getIt.get<DataCrudController>().deleteData(id: id);
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
        getIt.get<DataCrudController>().deleteData(id: element.id);
      });
      getAllReminder();
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }

}