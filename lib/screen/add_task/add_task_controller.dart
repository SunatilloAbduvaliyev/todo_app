import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskController extends GetxController {
  TimeOfDay? checkInitialTime;
  DateTime? startTime;
  DateTime? endTime;
  DateTime? idDateTime;
  TimeOfDay? startTimeOfDay;
  TimeOfDay? endTimeOfDay;
  DateFormat formatTime = DateFormat("HH:mm");
  RxString startTimeString = "start_time".obs;
  RxString endTimeString = "end_time".obs;
  RxString dateTimeString = "".obs;

  void setDateTime(DateTime dateTime, TimeOfDay timeOfDay) {
    checkInitialTime = timeOfDay;
    startTime = dateTime;
    endTime = dateTime;
    idDateTime = dateTime;
    debugPrint('_____________________idDateTime_______________$idDateTime');
    dateTimeString.value = DateFormat("MM/dd/yyyy").format(dateTime);
  }

  void changeDateTime(DateTime dateTime) {
    debugPrint('_____________________idDateTime_______________$idDateTime');
    if (startTimeOfDay == null || endTimeOfDay == null) {
      setDateTime(dateTime, checkInitialTime!);
    }
    if(startTimeOfDay != null) {
      startTime = dateTime.copyWith(
        hour: startTimeOfDay!.hour,
        minute: startTimeOfDay!.minute,
      );
      idDateTime = dateTime;
      debugPrint('_____________________idDateTime_______________$idDateTime');
      dateTimeString.value = DateFormat("MM/dd/yyyy").format(dateTime);
    }
    if(endTimeOfDay != null) {
      endTime = dateTime.copyWith(
        hour: endTimeOfDay!.hour,
        minute: endTimeOfDay!.minute,
      );
      idDateTime = dateTime;
      debugPrint('_____________________idDateTime_______________$idDateTime');
      dateTimeString.value = DateFormat("MM/dd/yyyy").format(dateTime);
    }
    if(startTimeOfDay != null && endTimeOfDay != null){
      startTime = dateTime.copyWith(
        hour: startTimeOfDay!.hour,
        minute: startTimeOfDay!.minute,
      );
      endTime = dateTime.copyWith(
        hour: endTimeOfDay!.hour,
        minute: endTimeOfDay!.minute,
      );
      debugPrint('_____________________idDateTime_______________$idDateTime');
      idDateTime = dateTime;
      dateTimeString.value = DateFormat("MM/dd/yyyy").format(dateTime);
    }
  }

  void setStartTime(TimeOfDay timeOfDay) {
    startTimeOfDay = timeOfDay;
    startTime = startTime!.copyWith(
      hour: timeOfDay.hour,
      minute: timeOfDay.minute,
    );
    startTimeString.value = formatTime.format(startTime!);
  }

  void setEndTime(TimeOfDay timeOfDay) {
    endTimeOfDay = timeOfDay;
    endTime = endTime!.copyWith(
      hour: timeOfDay.hour,
      minute: timeOfDay.minute,
    );
    endTimeString.value = formatTime.format(endTime!);
  }

  void setStartTimeError() => startTimeString.value = "error";

  void setEndTimeError() => endTimeString.value = "error";
}
