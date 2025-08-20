import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../shared/widgets.dart';
import 'widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(text: "Settings", hasBack: true, child: ProfileButtons()),
        SizedBox(height: 30.h),
        Text("Settings", style: AppTextStyles.cns32),
        SizedBox(height: 20.h),
        SettingsButton(
          text: "Notification",
          child: CustomCupertinoSwitch(
            width: 38.r,
            height: 20.r,
            value: true,
            activeColor: AppTheme.red,
            onChanged: (value) {},
          ),
        ),
        SizedBox(height: 20.h),
        SettingsButton(
          text: "Share App",
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/png/share2.png',
              width: 24.r,
              height: 24.r,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
