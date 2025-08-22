import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/widgets/widgets.dart';

import '../utils/utils.dart';

class CustomTimerModalPopup extends StatefulWidget {
  const CustomTimerModalPopup({
    super.key,
    required this.onSelected,
    required this.days,
    required this.hours,
    required this.minutes,
  });

  final int days;
  final int hours;
  final int minutes;
  final void Function(int days, int hours, int minutes) onSelected;

  @override
  State<CustomTimerModalPopup> createState() => _CustomTimerModalPopupState();
}

class _CustomTimerModalPopupState extends State<CustomTimerModalPopup> {
  int _selectedDay = 0;
  int _selectedHour = 0;
  int _selectedMinute = 0;

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.days;
    _selectedHour = widget.hours;
    _selectedMinute = widget.minutes;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: 390.w,
        height: 400.h,
        decoration: BoxDecoration(
          color: AppTheme.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    pickerTextStyle: AppTextStyles.cns16,
                  ),
                ),
                child: DayHourMinutePicker(
                  days: _selectedDay,
                  hours: _selectedHour,
                  minutes: _selectedMinute,
                  onSelected: (int days, int hours, int minutes) {
                    _selectedDay = days;
                    _selectedHour = hours;
                    _selectedMinute = minutes;
                  },
                ),
              ),
            ),
            Positioned(
              top: 15.h,
              right: 15.w,
              child: CustomButton2(
                text: "SAVE",
                width: 64.w,
                height: 32.h,
                color: AppTheme.black3,
                textStyle: AppTextStyles.cns12,
                onTap: () {
                  widget.onSelected(
                    _selectedDay,
                    _selectedHour,
                    _selectedMinute,
                  );
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
