import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 218.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(asset: 'assets/png/settings.png'),
            CustomIconButton(asset: 'assets/png/share.png'),
            SizedBox(width: 47.r, height: 47.r, child: Placeholder()),
          ],
        ),
      ),
    );
  }
}
