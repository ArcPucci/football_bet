import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key, required this.path, required this.child});

  final String path;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final hasNavBar =
        !path.contains('settings') &&
        !path.contains('profile') &&
        !path.contains('teams');
    print(path);
    return Material(
      color: AppTheme.black2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(child: child),
          if (hasNavBar)
            Positioned(
              bottom: 6.r,
              child: SafeArea(child: CustomNavBar(path: path)),
            ),
        ],
      ),
    );
  }
}
