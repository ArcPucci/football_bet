import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/providers/providers.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (BuildContext context, value, Widget? child) {
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
                value: value.notification,
                activeColor: AppTheme.red,
                onChanged: value.updateNotification,
              ),
            ),
            SizedBox(height: 20.h),
            SettingsButton(
              text: "Share App",
              child: GestureDetector(
                onTap: value.shareApp,
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
      },
    );
  }
}
