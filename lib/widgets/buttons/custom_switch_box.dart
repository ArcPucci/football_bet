import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

class CustomSwitchBox extends StatelessWidget {
  const CustomSwitchBox({super.key, required this.toggled});

  final bool toggled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 39.r,
      height: 39.r,
      decoration: BoxDecoration(color: AppTheme.red, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: RotatedBox(
        quarterTurns: toggled ? 1 : -1,
        child: Image.asset(
          'assets/png/back.png',
          width: 24.r,
          height: 24.r,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
