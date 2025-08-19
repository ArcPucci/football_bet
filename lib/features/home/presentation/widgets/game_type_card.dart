import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../../../../shared/widgets.dart';

class GameTypeCard extends StatelessWidget {
  const GameTypeCard({
    super.key,
    required this.text,
    required this.asset,
    this.width,
    this.height,
    this.right,
    this.bottom,
    this.onTap,
  });

  final String text;
  final String asset;
  final double? width;
  final double? height;
  final double? right;
  final double? bottom;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390.w,
      height: 207.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(27),
                child: Image.asset(
                  'assets/png/card_bg.png',
                  width: 345.r,
                  height: 177.r,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 10.r,
                bottom: 80.r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$text\nMATCH", style: AppTextStyles.cn32_700),
                    SizedBox(height: 5.r),
                    Text(
                      "new ${text.toLowerCase()} events",
                      style: AppTextStyles.cn12_400,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: right,
            bottom: bottom,
            child: Image.asset(
              asset,
              width: width,
              height: height,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 25.r,
            child: ButtonWithText2(text: "CREATE NEW", onTap: onTap),
          ),
        ],
      ),
    );
  }
}
