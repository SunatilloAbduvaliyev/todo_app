import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        margin: EdgeInsets.symmetric(horizontal: widget.width.w, vertical:  widget.height.h,),
      ),
    );
  }
}
