import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/widgets/widgets.dart';
import '../utils/utils.dart';

class CustomDateBox extends StatelessWidget {
  const CustomDateBox({
    super.key,
    required this.onSave,
    required this.days,
    required this.hours,
    required this.minutes,
  });

  final int days;
  final int hours;
  final int minutes;
  final void Function(int days, int hours, int minutes) onSave;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDatePicker(context),
      child: Container(
        width: 320.w,
        height: 63.h,
        decoration: BoxDecoration(
          color: AppTheme.black3,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${days}d:${hours}h:${minutes}m",
              style: AppTextStyles.cn14_700,
            ),
            CustomSwitchBox(toggled: false),
          ],
        ),
      ),
    );
  }

  void showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CustomTimerModalPopup(
          days: days,
          hours: hours,
          minutes: minutes,
          onSelected: onSave,
        );
      },
    );
  }
}
