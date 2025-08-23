import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../widgets.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RouterProvider>(context);
    return Center(
      child: SizedBox(
        width: 218.r,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: Consumer<ProfileProvider>(
            builder: (context, value, Widget? child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    asset: 'assets/png/settings.png',
                    onTap: provider.goToSettings,
                  ),
                  CustomIconButton(
                    asset: 'assets/png/share.png',
                    onTap: value.shareApp,
                  ),
                  GestureDetector(
                    onTap: provider.goToProfile,
                    child: AvatarCircle(size: 47.r, photo: value.profilePhoto),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
