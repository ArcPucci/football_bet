import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/providers/providers.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fullPath = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration.fullPath;
    return Consumer<ProfileProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            CustomAppBar(
              text: "Profile",
              hasBack: true,
              child: ProfileButtons(),
            ),
            SizedBox(height: 30.h),
            Text("Profile", style: AppTextStyles.cns32),
            SizedBox(height: 20.h),
            AvatarCard(profilePhoto: value.profilePhoto),
            SizedBox(height: 16.h),
            SizedBox(
              width: 320.w,
              child: Text(
                "${value.name} ${value.surname}",
                style: AppTextStyles.cns20,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.h),
            CustomButton2(
              text: "edit profile",
              width: 178.w,
              height: 45.h,
              borderRadius: 34,
              color: AppTheme.black,
              textStyle: AppTextStyles.cn16_400,
              onTap: () => context.go('$fullPath/edit'),
            ),
            SizedBox(height: 30.h),
            Container(
              width: 320.w,
              height: 273.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/png/rect2.png'),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Statistics", style: AppTextStyles.cns20),
                  Container(
                    width: 294.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      color: AppTheme.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${value.bets}", style: AppTextStyles.cns40),
                            Text("Bets", style: AppTextStyles.cns16),
                          ],
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${value.soccers} bets - Socer ",
                              style: AppTextStyles.cns10,
                            ),
                            SizedBox(height: 7.h),
                            Text(
                              "${value.footballs} bets - Football ",
                              style: AppTextStyles.cns10,
                            ),
                            SizedBox(height: 7.h),
                            Text(
                              "${value.basketballs} bets - Basketball ",
                              style: AppTextStyles.cns10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 141.w,
                        height: 90.h,
                        decoration: BoxDecoration(
                          color: AppTheme.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${value.bets - value.wins}",
                              style: AppTextStyles.cns40,
                            ),
                            Text("LOSS", style: AppTextStyles.cns16),
                          ],
                        ),
                      ),
                      Container(
                        width: 141.w,
                        height: 90.h,
                        decoration: BoxDecoration(
                          color: AppTheme.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${value.wins}", style: AppTextStyles.cns40),
                            Text("WINS", style: AppTextStyles.cns16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
