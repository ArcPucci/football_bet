import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class CommandsLogo extends StatelessWidget {
  const CommandsLogo({
    super.key,
    required this.firstLogo,
    required this.secondLogo,
  });

  final String firstLogo;
  final String secondLogo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 235.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(firstLogo),
          Text("VS", style: AppTextStyles.cn20_700),
          _buildLogo(secondLogo),
        ],
      ),
    );
  }

  Widget _buildLogo(String logo) {
    if (logo.startsWith('assets')) {
      return Image.asset(
        logo,
        width: 63.r,
        height: 63.r,
        fit: BoxFit.fill,
      );
    }

    return ClipOval(
      child: Image.file(
        File(logo),
        width: 63.r,
        height: 63.r,
        fit: BoxFit.fill,
      ),
    );
  }
}
