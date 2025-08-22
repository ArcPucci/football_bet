import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class AvatarCircle extends StatelessWidget {
  const AvatarCircle({super.key, this.photo, this.size, this.bgColor});

  final String? photo;
  final double? size;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    if (photo != null) {
      return ClipOval(
        child: Image.file(
          File(photo!),
          width: size ?? 47.r,
          height: size ?? 47.r,
          errorBuilder: (context, error, stackTrace) => Container(
            width: size ?? 47.r,
            height: size ?? 47.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor ?? AppTheme.black,
            ),
          ),
          fit: BoxFit.cover,
        ),
      );
    }

    return Container(
      width: size ?? 47.r,
      height: size ?? 47.r,
      decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor ?? AppTheme.black),
    );
  }
}
