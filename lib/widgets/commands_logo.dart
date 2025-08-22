import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class CommandsLogo extends StatelessWidget {
  const CommandsLogo({
    super.key,
    required this.firstLogo,
    required this.secondLogo,
  });

  final String firstLogo;
  final String secondLogo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 235.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            firstLogo,
            width: 63.r,
            height: 63.r,
            fit: BoxFit.fill,
          ),
          Text("VS", style: AppTextStyles.cn20_700),
          Image.asset(
            secondLogo,
            width: 63.r,
            height: 63.r,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
