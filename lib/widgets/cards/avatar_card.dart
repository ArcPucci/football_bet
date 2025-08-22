import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    super.key,
    this.canEdit = false,
    this.profilePhoto,
    this.onTap,
  });

  final bool canEdit;
  final String? profilePhoto;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    if (profilePhoto != null) {
      return GestureDetector(
        onTap: canEdit ? onTap : null,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: canEdit ? 0.4 : 1,
              child: ClipOval(
                child: Image.file(
                  File(profilePhoto!),
                  width: 120.r,
                  height: 120.r,
                  errorBuilder: (context, error, stackTrace) => GestureDetector(
                    onTap: canEdit ? onTap : null,
                    child: Container(
                      width: 120.r,
                      height: 120.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.black,
                      ),
                      alignment: Alignment.center,
                      child: canEdit
                          ? Image.asset(
                              'assets/png/camera.png',
                              width: 24.r,
                              height: 24.r,
                              fit: BoxFit.fill,
                            )
                          : null,
                    ),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (canEdit)
              Image.asset(
                'assets/png/camera.png',
                width: 24.r,
                height: 24.r,
                fit: BoxFit.fill,
              ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: canEdit ? onTap : null,
      child: Container(
        width: 120.r,
        height: 120.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.black,
        ),
        alignment: Alignment.center,
        child: canEdit
            ? Image.asset(
                'assets/png/camera.png',
                width: 24.r,
                height: 24.r,
                fit: BoxFit.fill,
              )
            : null,
      ),
    );
  }
}
