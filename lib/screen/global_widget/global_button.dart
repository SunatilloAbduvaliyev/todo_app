import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/utils/style/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalButton extends StatefulWidget {
  const GlobalButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
    this.verticalSize = 10.0,
  });

  final String title;
  final VoidCallback onTap;
  final Color color;
  final double verticalSize;

  @override
  State<GlobalButton> createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin:  EdgeInsets.symmetric(horizontal: 15, vertical: widget.verticalSize),
          child: Center(
            child: Text(
              widget.title.tr,
              style: AppTextStyle.regular.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
