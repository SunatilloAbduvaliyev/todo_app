import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../../data/model/task_model/task_model.dart';
import '../../../../../utils/extension/extension.dart';
import '../../../../../utils/images/app_images.dart';
import '../../../../../utils/style/app_text_style.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.taskModel,
    required this.index,
  });

  final TaskModel taskModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(
            hexStringToHexInt(taskModel.color),
          ),
          borderRadius: BorderRadius.circular(10).r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            taskModel.title,
            style: AppTextStyle.bold.copyWith(
              fontSize: 20.sp,
              color: Colors.white,
            ),
          ),
          Text(
            taskModel.description,
            style: AppTextStyle.regular.copyWith(
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.date,
                width: 30.w,
                height: 30.h,
              ),
              Text(
                DateFormat('EEEE, MMMM dd, y, HH:mm')
                    .format(taskModel.startTime),
                style: AppTextStyle.regular.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.date,
                width: 30.w,
                height: 30.h,
              ),
              Text(
                DateFormat('EEEE, MMMM dd, y, HH:mm').format(taskModel.endTime),
                style: AppTextStyle.regular.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    )
        .animate(delay: Duration(milliseconds: (200+index*200)))
        .slideX(
          duration: const Duration(seconds: 1),
        )
        .moveY(
          duration: const Duration(seconds: 1),
        );
  }
}
