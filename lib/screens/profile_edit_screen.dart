import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          CustomAppBar(text: "back", hasBack: true, child: ProfileButtons()),
          SizedBox(height: 30.h),
          Text("Edit Profile", style: AppTextStyles.cns32),
          SizedBox(height: 7.h),
          Opacity(
            opacity: 0.5,
            child: Text(
              "Replace your first and last\nname if necessary",
              style: AppTextStyles.cn14_400,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30.h),
          SizedBox(width: 120.r, height: 120.r, child: Placeholder()),
          SizedBox(height: 25.h),
          CustomTextField(title: "Name"),
          SizedBox(height: 25.h),
          CustomTextField(title: "Surname"),
          Spacer(),
          CustomButton2(text: "Replace", width: 325.w, height: 45.h),
          SizedBox(height: 45.h),
        ],
      ),
    );
  }
}
