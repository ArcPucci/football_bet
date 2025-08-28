import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

class NewPlayerCard extends StatelessWidget {
  const NewPlayerCard({
    super.key,
    this.photo,
    this.controller,
    this.onAddPhoto,
    this.onRemove,
    this.maxLength,
  });

  final File? photo;
  final TextEditingController? controller;
  final VoidCallback? onAddPhoto;
  final VoidCallback? onRemove;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppTheme.black,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: AppTextStyles.cns12,
              inputFormatters: [
                LengthLimitingTextInputFormatter(maxLength ?? 16),
              ],
              decoration: InputDecoration.collapsed(
                hintText: 'Player name',
                hintStyle: AppTextStyles.cns12.copyWith(
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          _buildImage(),
          SizedBox(width: 5.w),
          GestureDetector(
            onTap: onRemove,
            child: Image.asset(
              'assets/png/remove.png',
              width: 28.r,
              height: 28.r,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (photo != null) {
      return GestureDetector(
        onTap: onAddPhoto,
        child: ClipOval(
          child: Image.file(
            photo!,
            width: 47.r,
            height: 47.r,
            fit: BoxFit.fill,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onAddPhoto,
      child: Container(
        width: 82.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          "ADD PHOTO",
          style: AppTextStyles.cns10.copyWith(color: AppTheme.black5),
        ),
      ),
    );
  }
}
