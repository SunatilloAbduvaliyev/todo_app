import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/model/task_model/task_model.dart';
import 'package:todo_app/screen/add_task/add_task_controller.dart';
import 'package:todo_app/screen/add_task/widget/item_color.dart';
import 'package:todo_app/screen/controller/tasks_controller.dart';
import 'package:todo_app/screen/global_widget/global_button.dart';
import 'package:todo_app/screen/global_widget/show_date_picker.dart';
import 'package:todo_app/screen/global_widget/show_time_picker.dart';
import 'package:todo_app/utils/extension/extension.dart';
import 'package:todo_app/utils/images/app_images.dart';
import 'package:todo_app/utils/style/app_text_style.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/ui_utils/ui_utils.dart';
import '../../global_widget/drawer_widget.dart';
import '../widget/input_task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime? dateTime;
  TimeOfDay? startTimeOfDay;
  TimeOfDay? endTimeOfDay;
  String colorItem = 'FFCCFF80';
  AddTaskController controller = Get.find<AddTaskController>();
  TasksController crudController = Get.put(TasksController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    width = context.width;
    height = context.height;
    debugPrint('_______________________________________build run');
    return ThemeSwitchingArea(
      child: SafeArea(
        child: Scaffold(
          drawer: const DrawerWidget(),
          appBar: AppBar(
            title: Text(
              'enter_your_daily_task'.tr,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
          ),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    10.boxH(),
                    InputTask(
                      title: 'title'.tr,
                      controller: titleController,
                    ),
                    10.boxH(),
                    InputTask(
                      title: 'description'.tr,
                      controller: descriptionController,
                      isDescription: true,
                    ),
                    10.boxH(),
                    Obx(
                          () =>
                          ListTile(
                            tileColor: const Color(0xFF8875FF),
                            title: Text(
                              controller.dateTimeString.value,
                              style: AppTextStyle.medium.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(10), // BorderRadius
                            ),
                            trailing: SvgPicture.asset(
                              AppImages.date,
                              width: 24.w,
                              height: 24.h,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            onTap: () async {
                              dateTime =
                              await showDatePickerWithContext(context);
                              controller.changeDateTime(dateTime!);
                            },
                          ),
                    ),
                    10.boxH(),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                                () =>
                                GlobalButton(
                                  title: controller.startTimeString.value,
                                  onTap: () async {
                                    startTimeOfDay =
                                    await showTimePickerWithContext(context);
                                    startTimeOfDay ??=
                                        controller.startTimeOfDay;
                                    if (startTimeOfDay != null) {
                                      if (controller.checkInitialTime!.hour < startTimeOfDay!.hour) {
                                        //2 marta tanlanishdagi xatoliklar uchun
                                        if (endTimeOfDay != null &&
                                            startTimeOfDay != null) {
                                          //taskning boshlanish vaqti tugash vaqat soati  kichiklik holatiga error
                                          if (endTimeOfDay!.hour < startTimeOfDay!.hour) {
                                            if (!context.mounted) return;
                                            showErrorMessage(
                                              context: context,
                                              message: "error_three_time",
                                            );
                                            controller.setStartTimeError();
                                          }
                                          //taskning boshlanish vaqti tugash vaqat soati  kichiklik holatiga error
                                          //-
                                          //taskning boshlanish vaqti va tugash vati o'zora tent bo'lgan holatiga
                                          else if (endTimeOfDay!.hour == startTimeOfDay!.hour && endTimeOfDay!.minute == startTimeOfDay!.minute) {
                                            if (!context.mounted) return;
                                            showErrorMessage(
                                              context: context,
                                              message: "error_two_time",
                                            );
                                            controller.setStartTimeError();
                                          }
                                          //taskning boshlanish vaqti va tugash vati o'zora tent bo'lgan holatiga
                                          //-
                                          else if(endTimeOfDay!.hour >= startTimeOfDay!.hour &&  endTimeOfDay!.minute < startTimeOfDay!.minute){
                                            if (!context.mounted) return;
                                            showErrorMessage(
                                              context: context,
                                              message: "error_three_time",
                                            );
                                            controller.setStartTimeError();
                                          }
                                          //-
                                          else if(endTimeOfDay!.hour >= startTimeOfDay!.hour){
                                            controller.setStartTime(startTimeOfDay!);
                                          }
                                        }else{controller.setStartTime(startTimeOfDay!);}
                                        //2 marta tanlanishdagi xatoliklar uchun
                                        //-
                                        if (dateTime != null) {
                                          controller.changeDateTime(dateTime!);
                                        }
                                      }
                                      else {
                                        if (!context.mounted) return;
                                        showErrorMessage(
                                          context: context,
                                          message: "error_four_time",
                                        );
                                        controller.setStartTimeError();
                                      }
                                    } else {
                                      if (!context.mounted) return;
                                      showErrorMessage(
                                        context: context,
                                        message: "time_null",
                                      );
                                      controller.setStartTimeError();
                                    }
                                  },
                                  color: controller.startTimeString.value ==
                                      "error"
                                      ? Colors.red
                                      : const Color(0xFF8875FF),
                                  verticalSize: 20.0,
                                ),
                          ),
                        ),
                        5.boxW(),
                        Expanded(
                          child: Obx(
                                () =>
                                GlobalButton(
                                  title: controller.endTimeString.value,
                                  onTap: () async {
                                    endTimeOfDay =
                                    await showTimePickerWithContext(context);
                                    endTimeOfDay ??= controller.endTimeOfDay;
                                    if (endTimeOfDay != null) {
                                      //taskning tugash vaqti 2 marta tanlanish holatidagi xatoliklar uchun
                                      if (endTimeOfDay != null && startTimeOfDay != null) {
                                        //taskning tugash vaqti boshlanish vaqtidan kichik bo'lgan holatidagi error uchun
                                        if (endTimeOfDay!.hour < startTimeOfDay!.hour) {
                                          if (!context.mounted) return;
                                          showErrorMessage(
                                            context: context,
                                            message: "error_one_time",
                                          );
                                          controller.setEndTimeError();
                                        }
                                        //taskning tugash vaqti boshlanish vaqtidan kichik bo'lgan holatidagi error uchun
                                        //-
                                        //taskning tugash vaqti va boshlanish vaqti o'zaro teng bo'lgan holatidagi error uchun
                                        else if (endTimeOfDay!.hour == startTimeOfDay!.hour && endTimeOfDay!.minute == startTimeOfDay!.minute) {
                                          if (!context.mounted) return;
                                          showErrorMessage(
                                            context: context,
                                            message: "error_two_time",
                                          );
                                          controller.setEndTimeError();
                                        }
                                        //taskning tugash vaqti va boshlanish vaqti o'zaro teng bo'lgan holatidagi error uchun
                                        //-
                                        else if(endTimeOfDay!.hour==startTimeOfDay!.hour && endTimeOfDay!.minute <= startTimeOfDay!.minute){
                                          if (!context.mounted) return;
                                          showErrorMessage(
                                            context: context,
                                            message: "error_one_time",
                                          );
                                          controller.setEndTimeError();
                                        }
                                        //-
                                        //success uchun
                                        else if (endTimeOfDay!.hour >= startTimeOfDay!.hour) {
                                          controller.setEndTime(endTimeOfDay!);
                                        }
                                      }
                                      //taskning tugash vaqti 2 marta tanlanish holatidagi xatoliklar uchun
                                      //-
                                      //taskning tugash vaqti 1 - bo'lib   tanlanish saqlash holati
                                      else {
                                        controller.setEndTime(endTimeOfDay!);
                                      }
                                      //taskning tugash vaqti 1 - bo'lib tanlanish saqlash holati
                                      //-
                                      if (dateTime != null) {
                                        controller.changeDateTime(dateTime!);
                                      }
                                    } else {
                                      if (!context.mounted) return;
                                      showErrorMessage(
                                        context: context,
                                        message: "time_null",
                                      );
                                      controller.setEndTimeError();
                                    }
                                  },
                                  color: controller.endTimeString.value ==
                                      "error"
                                      ? Colors.red
                                      : const Color(0xFF8875FF),
                                  verticalSize: 20.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                    20.boxH(),
                    Row(
                      children: [
                        Expanded(
                          child: ItemColor(onColor: (value) {
                            colorItem = value;
                          }),
                        ),
                        Expanded(
                          child: GlobalButton(
                            title: 'create'.tr,
                            onTap: () {
                              if (_formKey.currentState!.validate() &&
                                  endTimeOfDay != null &&
                                  startTimeOfDay != null) {
                                crudController.insertTask(
                                  taskModel: TaskModel(
                                    title: titleController.text,
                                    description: descriptionController.text,
                                    isDone: false,
                                    id: DateTime.now().microsecond,
                                    endTime: controller.endTime!,
                                    startTime: controller.startTime!,
                                    searchId: controller.idDateTime!,
                                    color: colorItem,
                                  ),
                                  dateTime: DateTime(controller.idDateTime!.year, controller.idDateTime!.month, controller.idDateTime!.day, 0, 0, 0)
                                );
                                Navigator.of(context).pop();
                              } else {
                                showErrorMessage(
                                  context: context,
                                  message: "fill_field".tr,
                                );
                              }
                            },
                            color: AppColors.c_8875FF,
                            verticalSize: 20,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
