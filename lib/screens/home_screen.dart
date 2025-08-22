import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                HomeBanner(),
                SizedBox(height: 20.r),
                SizedBox(
                  width: 350.w,
                  child: Text("My Events", style: AppTextStyles.cn20_700),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    itemBuilder: (context, index) {
                      return GameCard(onTap: () => context.go('/details'));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 20.h);
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: CustomAppBar(text: "HOME", child: ProfileButtons()),
        ),
      ],
    );
  }
}
