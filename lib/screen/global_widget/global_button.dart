import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/utils/style/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalButton extends StatefulWidget {
  const GlobalButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.width,
    required this.height,
    required this.color,
  });

  final String title;
  final VoidCallback onTap;
  final double width;
  final double height;
  final Color color;

  @override
  State<GlobalButton> createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: widget.onTap,
      child: Container(
        width: widget.width.w,
        height: widget.height.h,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.title.tr,
            style: AppTextStyle.regular.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
