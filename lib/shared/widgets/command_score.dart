import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/core.dart';
import '../widgets.dart';

class CommandScore extends StatelessWidget {
  const CommandScore({super.key});

  @override
  Widget build(BuildContext context) {
    return                             Container(
      width: 286.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppTheme.black2,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.only(left: 10.w, right: 12.w),
      child: Row(
        children: [
          Image.asset(
            'assets/png/man_city.png',
            width: 38.r,
            height: 38.r,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 10.w),
          Text("MAN CITY", style: AppTextStyles.cns12),
          Spacer(),
          NumberPicker(
            primaryColor: AppTheme.green,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
