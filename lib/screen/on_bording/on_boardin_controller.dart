import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/screen/tab/view/tab_screen.dart';

class PageViewController extends GetxController{
  RxInt activeIndex = 0.obs;
  RxInt visibleIndex = 0.obs;
  RxBool isVisible = false.obs;

  void nextPageIndex(){
    isVisible.value = true;
    if (activeIndex.value < 2) {
      activeIndex++;
      visibleIndex++;
    } else {
      Get.offAll(const TabBoxScreen());
    }
  }
  void backPageIndex(){
    if (activeIndex.value > 0) {
      activeIndex--;
      if(activeIndex.value==2){
        visibleIndex--;
        debugPrint('----------------------------$visibleIndex');
      }
      visibleIndex--;
      if(visibleIndex.value == 0){
        isVisible.value = false;
      }
    }
  }
}