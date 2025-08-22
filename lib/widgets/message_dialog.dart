import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/utils/utils.dart';
import 'package:football_bet/widgets/buttons/buttons.dart';

class MessageDialog extends StatelessWidget {
  const MessageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 330.w,
          height: 419.h,
          decoration: BoxDecoration(
            color: AppTheme.black,
            borderRadius: BorderRadius.circular(34),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                top: 22.h,
                bottom: 22.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Explanation", style: AppTextStyles.cns20),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "We don't have real money bets\n",
                            style: AppTextStyles.cns14.copyWith(
                              color: AppTheme.red,
                            ),
                          ),
                          TextSpan(
                            text: "- just pure sports interest!\n\n",
                            style: AppTextStyles.cns14,
                          ),
                          TextSpan(
                            text:
                                "Here you and your friends can\nmake predictions and bet\nagainst each other on the\nresults of matches.\n\n",
                            style: AppTextStyles.cn14_400.copyWith(
                              color: Colors.white.withValues(alpha: 0.5),
                            ),
                          ),
                          TextSpan(
                            text:
                                "No costs, just excitement,\nemotions and the opportunity\nto test your sports intuition.\n\n",
                            style: AppTextStyles.cn14_400.copyWith(
                              color: Colors.white.withValues(alpha: 0.5),
                            ),
                          ),
                          TextSpan(
                            text:
                                "This is a place for those who\nwant to feel the atmosphere\nof real bets, but without\nrisking their wallets",
                            style: AppTextStyles.cn14_400.copyWith(
                              color: Colors.white.withValues(alpha: 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton2(
                      text: "CONTINUE",
                      width: 298.w,
                      height: 56.h,
                      borderRadius: 34,
                      textStyle: AppTextStyles.cns16,
                      onTap: Navigator.of(context).pop,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 22.h,
                right: 16.h,
                child: GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: Image.asset(
                    'assets/png/close.png',
                    width: 24.r,
                    height: 24.r,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
