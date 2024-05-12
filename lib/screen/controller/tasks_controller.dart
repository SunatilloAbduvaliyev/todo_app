import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data/local/local_storage/task_local_storage.dart';
import '../../data/model/task_model/task_model.dart';
import '../../services/services_locator.dart';


class TasksController extends GetxController{
  RxBool isLoading = false.obs;
  RxList tasksList = [].obs;
  RxList searchList = [].obs;
  RxString errorMessage = "".obs;
  RxString dateTime = DateFormat.yMMMd().format(DateTime.now()).obs;

  void searchTask(DateTime dateTime) async {
    List<TaskModel> result = [];
    isLoading.value = true; // Ishonchli yuklashni boshlaymiz
    try {
      debugPrint('searchTask working...');
      for(int i = 0; i <searchList.length; i++) {
        debugPrint('searchId dateTime:  ${searchList[i].searchId}');
        debugPrint('data dateTime: $dateTime');
        if(searchList[i].searchId == dateTime){
          result.add(searchList[i]);
        }
      }
      tasksList.value = result;
    } catch (error) {
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getAllTasks() async {
    isLoading.value = true;
    try {
      List<TaskModel> data = await getIt.get<TaskCrudController>().getAllTasks();
      debugPrint('_____-_______-data ${data.length}');
      if(data.isNotEmpty){
        data.sort((a, b) => b.id.compareTo(a.id));
        searchList.value = data;
        tasksList.value = data;
      }else{
        tasksList.value = [];
      }
    } catch (error) {
      throw Exception(error);
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> insertTask({required TaskModel taskModel}) async {
    isLoading.value = true;
    try {
      await getIt.get<TaskCrudController>().insertTask(taskModel);
      getAllTasks();
    } catch (error) {
      throw Exception(error.toString());
      errorMessage.value = error.toString();
    }
  }


  Future<void> updateTask({required TaskModel taskModel}) async {
    try {
      await getIt.get<TaskCrudController>().insertTask(taskModel);
      List<TaskModel> data = await getIt.get<TaskCrudController>().getAllTasks();
      data.sort((a, b) => b.id.compareTo(a.id));
      tasksList.value = data;
    } catch (error) {
      throw Exception(error);

      errorMessage.value = error.toString();
    }
  }

  Future<void> deleteTask({required int id})async{
    isLoading.value = true;
    try {
      await getIt.get<TaskCrudController>().deleteTask(id: id);
      getAllTasks();
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }

  Future<void> restartTask()async{
    isLoading.value = true;
    try {
      List<TaskModel>  data = await getIt.get<TaskCrudController>().getAllTasks();
      await Future.forEach(data, (element){
        getIt.get<TaskCrudController>().deleteTask(id: element.id);
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