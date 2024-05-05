import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app/screen/add_task/add_task_controller.dart';
import 'package:todo_app/screen/global_widget/global_button.dart';
import 'package:todo_app/screen/global_widget/show_date_picker.dart';
import 'package:todo_app/screen/global_widget/show_time_picker.dart';
import 'package:todo_app/utils/extension/extension.dart';
import 'package:todo_app/utils/images/app_images.dart';
import 'package:todo_app/utils/style/app_text_style.dart';

import '../../../utils/ui_uitls/ui_utils.dart';
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
  List<String> tasks = [];
  List<bool> checkTasks = [];
  List<DateTime> tasksDate = [];
  AddTaskController controller = Get.find<AddTaskController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    debugPrint('_______________________________________build run');
    return ThemeSwitchingArea(
      child: SafeArea(
        child: Scaffold(
          drawer: const DrawerWidget(),
          appBar: AppBar(
            title: Text(
              'enter_your_daily_task'.tr,
              style: Theme.of(context).textTheme.titleMedium,
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
                      () => ListTile(
                        tileColor: const Color(0xFF8875FF),
                        title: Text(
                          controller.dateTimeString.value,
                          style: AppTextStyle.medium.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // BorderRadius
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
                        onTap: ()async{
                          dateTime = await showDatePickerWithContext(context);
                          controller.changeDateTime(dateTime!);
                        },
                      ),
                    ),
                    10.boxH(),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => GlobalButton(
                              title: controller.startTimeString.value,
                              onTap: () async {
                                startTimeOfDay =
                                    await showTimePickerWithContext(context);
                                if (endTimeOfDay != null &&
                                    startTimeOfDay != null) {
                                  if (endTimeOfDay!.hour <
                                      startTimeOfDay!.hour) {
                                    if (!context.mounted) return;
                                    showErrorMessage(
                                      context: context,
                                      message: "error_three_time",
                                    );
                                    controller.setStartTimeError();
                                  } else if (endTimeOfDay!.hour ==
                                      startTimeOfDay!.hour) {
                                    if (!context.mounted) return;
                                    showErrorMessage(
                                      context: context,
                                      message: "error_two_time",
                                    );
                                    controller.setStartTimeError();
                                  }
                                } else {
                                  controller.setStartTime(startTimeOfDay!);
                                }
                                if (endTimeOfDay != null &&
                                    startTimeOfDay != null &&
                                    endTimeOfDay!.hour > startTimeOfDay!.hour &&
                                    endTimeOfDay!.hour !=
                                        startTimeOfDay!.hour) {
                                  controller.setStartTime(startTimeOfDay!);
                                }
                                if(dateTime!=null){
                                  controller.changeDateTime(dateTime!);
                                }
                              },
                              color: const Color(0xFF8875FF),
                              verticalSize: 20.0,
                            ),
                          ),
                        ),
                        5.boxW(),
                        Expanded(
                          child: Obx(
                            () => GlobalButton(
                              title: controller.endTimeString.value,
                              onTap: () async {
                                endTimeOfDay =
                                    await showTimePickerWithContext(context);
                                if (endTimeOfDay != null &&
                                    startTimeOfDay != null) {
                                  if (endTimeOfDay!.hour <
                                      startTimeOfDay!.hour) {
                                    if (!context.mounted) return;
                                    showErrorMessage(
                                      context: context,
                                      message: "error_one_time",
                                    );
                                    controller.setEndTimeError();
                                  } else if (endTimeOfDay!.hour ==
                                      startTimeOfDay!.hour) {
                                    if (!context.mounted) return;
                                    showErrorMessage(
                                      context: context,
                                      message: "error_two_time",
                                    );
                                    controller.setEndTimeError();
                                  }
                                } else {
                                  controller.setEndTime(endTimeOfDay!);
                                }
                                if (endTimeOfDay != null &&
                                    startTimeOfDay != null &&
                                    endTimeOfDay!.hour > startTimeOfDay!.hour &&
                                    endTimeOfDay!.hour !=
                                        startTimeOfDay!.hour) {
                                  controller.setEndTime(endTimeOfDay!);
                                }
                                if(dateTime!=null){
                                  controller.changeDateTime(dateTime!);
                                }
                              },
                              color: const Color(0xFF8875FF),
                              verticalSize: 20.0,
                            ),
                          ),
                        ),
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
