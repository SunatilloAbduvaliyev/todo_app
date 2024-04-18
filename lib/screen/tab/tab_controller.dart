import 'package:get/get.dart';

class TabBoxController extends GetxController{
  RxInt tabIndex = 0.obs;

  void changeTab(int index){
    tabIndex.value = index;
  }
}