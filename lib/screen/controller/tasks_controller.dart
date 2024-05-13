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
  void searchTask(DateTime dateTime)  {
    List<TaskModel> result = [];
    isLoading.value = true;
    try {
      debugPrint('searchTask working...');
      for(int i = 0; i <searchList.length; i++) {
        if(searchList[i].searchId == dateTime){
          result.add(searchList[i]);
        }
        debugPrint('list result:  $result taskList: $tasksList');
      }
      tasksList.value = result;
    } catch (error) {
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getAllTasks( DateTime dateTime) async {
    isLoading.value = true;
    try {
      List<TaskModel> data = await getIt.get<TaskCrudController>().getAllTasks();
      debugPrint('_____-_______-data ${data.length}');
      if(data.isNotEmpty){
        data.sort((a, b) => a.startTime.compareTo(b.startTime));
        searchList.value = data;
        searchTask(dateTime);
      }else{
        tasksList.value = [];
      }
    } catch (error) {
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> insertTask({required TaskModel taskModel, required DateTime dateTime}) async {
    isLoading.value = true;
    try {
      await getIt.get<TaskCrudController>().insertTask(taskModel);
      getAllTasks(dateTime);
    } catch (error) {
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
      errorMessage.value = error.toString();
    }
  }

  Future<void> deleteTask({required int id})async{
    isLoading.value = true;
    try {
      await getIt.get<TaskCrudController>().deleteTask(id: id);
      //getAllTasks(); o'sha kunni date berish kerak
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
      //getAllTasks(); o'sha kunni date berish kerak
    } catch (error) {
      errorMessage.value = error.toString();
    }
  }

  void changedDate(DateTime date){
    dateTime.value = DateFormat.yMMMd().format(date);
  }

}