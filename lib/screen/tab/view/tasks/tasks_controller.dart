import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../data/local/local_storage.dart';
import '../../../../data/model/task_model/task_model.dart';
import '../../../../services/services_locator.dart';


class TasksController extends GetxController{
  RxBool isLoading = false.obs;
  RxList tasksList = [].obs;
  RxList checkTasksList = [].obs;
  RxString errorMessage = "".obs;
  RxString dateTime = DateFormat.yMMMd().format(DateTime.now()).obs;

  Future<void> getAllTasks() async {
    isLoading.value = true;
    try {
      List<TaskModel> data = await getIt.get<DataCrudController>().getAllTasks();
      if(data.isNotEmpty){
        data.sort((a, b) => b.id.compareTo(a.id));
        tasksList.value = data;
      }else{
        tasksList.value = [];
      }
    } catch (error) {
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> insertTask({required TaskModel taskModel}) async {
    isLoading.value = true;
    try {
      await getIt.get<DataCrudController>().insertTask(taskModel);
      getAllTasks();
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }


  Future<void> updateTask({required TaskModel taskModel}) async {
    try {
      await getIt.get<DataCrudController>().insertTask(taskModel);
      List<TaskModel> data = await getIt.get<DataCrudController>().getAllTasks();
      data.sort((a, b) => b.id.compareTo(a.id));
      tasksList.value = data;
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }

  Future<void> deleteTask({required DateTime id})async{
    isLoading.value = true;
    try {
      await getIt.get<DataCrudController>().deleteTask(id: id);
      getAllTasks();
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }

  Future<void> restartTask()async{
    isLoading.value = true;
    try {
      List<TaskModel>  data = await getIt.get<DataCrudController>().getAllTasks();
      await Future.forEach(data, (element){
        getIt.get<DataCrudController>().deleteTask(id: element.id);
      });
      getAllTasks();
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }

  void changedDate(DateTime date){
    dateTime.value = DateFormat.yMMMd().format(date);
  }

}