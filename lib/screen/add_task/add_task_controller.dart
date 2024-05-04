import 'package:get/get.dart';

class AddTaskController extends GetxController{
  RxBool isDate = false.obs;
  void checkIsDate()=>isDate.value = true;
}