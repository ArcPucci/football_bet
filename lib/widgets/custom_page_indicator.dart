import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({super.key, required this.selected});

  final int selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (index) {
          final active = index == selected;
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: active ? 10.r : 6.r,
            height: active ? 10.r : 6.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active ? Colors.white : null,
              border: active
                  ? null
                  : Border.all(width: 1.sp, color: Colors.white),
            ),
          );
        }),
      ),
    );
  }
}
