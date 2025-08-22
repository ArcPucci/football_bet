import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/utils/utils.dart';
import 'package:football_bet/widgets/widgets.dart';
import 'package:go_router/go_router.dart';


class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    final selected = _getSelected(path);
    return SizedBox(
      width: 366.r,
      height: 88.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: NavBarClipper(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 40, sigmaX: 40),
                child: Container(
                  width: 366.r,
                  height: 71.r,
                  color: Colors.black.withValues(alpha: 0.55),
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(2, (index) {
                      return SizedBox(
                        width: 115.r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(2, (subIndex) {
                            final item = navBarItems[index * 2 + subIndex];
                            final asset = selected == index * 2 + subIndex
                                ? item.selectedAsset
                                : item.asset;
                            return GestureDetector(
                              onTap: () {
                                if (item.path != path) context.go(item.path);
                              },
                              child: Container(
                                width: 50.r,
                                height: 50.r,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  asset,
                                  width: 24.r,
                                  height: 24.r,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () => context.go('/events'),
              child: ClipOval(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                  child: Container(
                    width: 49.r,
                    height: 49.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected == -1
                          ? AppTheme.red
                          : Colors.black.withValues(alpha: 0.55),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/png/add.png',
                      width: 24.r,
                      height: 24.r,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _getSelected(String path) {
    if (path.contains('events')) return -1;

    for (int i = navBarItems.length - 1; i >= 0; i--) {
      if (path.contains(navBarItems[i].path)) {
        return i;
      }
    }

    return 0;
  }
}
