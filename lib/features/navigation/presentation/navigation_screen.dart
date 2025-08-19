import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/shared/widgets/widgets.dart';

import '../../../core/core.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key, required this.path, required this.child});

  final String path;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.black2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(child: child),
          Positioned(
            bottom: 6.r,
            child: SafeArea(child: CustomNavBar(path: path)),
          ),
        ],
      ),
    );
  }
}
