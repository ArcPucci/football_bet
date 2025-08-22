import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/models/models.dart';

import '../../utils/utils.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({super.key, required this.notificationModel, this.onInit});

  final NotificationModel notificationModel;
  final VoidCallback? onInit;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  void initState() {
    super.initState();
    widget.onInit?.call();
  }

  @override
  Widget build(BuildContext context) {
    final sport = sportModels.firstWhere(
      (e) => widget.notificationModel.sportType == e.sportType,
    );
    return Container(
      width: 355.w,
      height: 67.h,
      decoration: BoxDecoration(
        color: AppTheme.black,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Image.asset(sport.logo, width: 39.r, height: 39.r, fit: BoxFit.fill),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "${widget.notificationModel.firstTeam} — ${widget.notificationModel.secondTeam}",
                      style: AppTextStyles.cn15_400,
                    ),
                  ),
                ),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        "The bet closes in ${widget.notificationModel.remainingTime} minutes",
                        style: AppTextStyles.cn10_400.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
