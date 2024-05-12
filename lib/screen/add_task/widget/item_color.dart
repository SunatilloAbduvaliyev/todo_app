import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/extension/extension.dart';

class ItemColor extends StatefulWidget {
  const ItemColor({
    super.key,
    required this.onColor,
  });

  final ValueChanged onColor;

  @override
  State<ItemColor> createState() => _ItemColorState();
}

class _ItemColorState extends State<ItemColor> {
  List<String> colors = [
    "FF007438",
    "FFCCFF80",
    "FFFF9680",
  ];
  int _currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        colors.length,
        (index) => GestureDetector(
          onTap: (){
            setState(() {
              _currentIndex = index;
              widget.onColor.call(
                colors[index]
              );
            });
          },
          child: Container(
            width: 40.w,
            height: 40.h,
            margin: EdgeInsets.only(left: 5.w),
            decoration: BoxDecoration(
              color: Color(hexStringToHexInt(colors[index]),),
              shape: BoxShape.circle,
            ),
            child: Visibility(
              visible: _currentIndex == index,
              child: Center(
                child: Icon(
                  Icons.check,
                  size: 20.w,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
