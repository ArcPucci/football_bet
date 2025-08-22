import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

class NewTeamCard extends StatelessWidget {
  const NewTeamCard({
    super.key,
    this.path,
    this.controller,
    this.rating = 0,
    required this.onChangedRating,
    this.onAddLogo,
  });

  final String? path;
  final TextEditingController? controller;
  final int rating;
  final void Function(int rating) onChangedRating;
  final VoidCallback? onAddLogo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 355.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: AppTheme.black,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  style: AppTextStyles.cns12,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Team name',
                    hintStyle: AppTextStyles.cns12.copyWith(
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              _buildLogo(),
            ],
          ),
        ),
        Container(
          width: 255.w,
          height: 47.h,
          decoration: BoxDecoration(
            color: AppTheme.grey2,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: 0.5,
                child: Text("Team rating - ", style: AppTextStyles.cns14),
              ),
              SizedBox(width: 5.w),
              SizedBox(
                width: 90.r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index) {
                    final active = rating > index;
                    return GestureDetector(
                      onTap: () => onChangedRating.call(index + 1),
                      child: Opacity(
                        opacity: active ? 1 : 0.2,
                        child: Image.asset(
                          'assets/png/red_star.png',
                          width: 15.r,
                          height: 15.r,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    if (path != null) {
      return GestureDetector(
        onTap: onAddLogo,
        child: ClipOval(
          child: Image.file(
            File(path!),
            width: 50.r,
            height: 50.r,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onAddLogo,
      child: Container(
        width: 71.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          "ADD LOGO",
          style: AppTextStyles.cns10.copyWith(color: AppTheme.black5),
        ),
      ),
    );
  }
}
